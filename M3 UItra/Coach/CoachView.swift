//
//  CoachView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 7/12/24.
//

import SwiftUI
import GoogleGenerativeAI
import MarkdownUI

struct CoachView: View {
    @State var messages: [chatMessage] = []
    @State var messageFild = ""
    @State var loading = false
    @State var firstLoading = true
    @State var notsupport = false
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    if !firstLoading && !notsupport {
                        ScrollView {
                            ForEach(messages) { i in
                                Group {
                                    if i.message != "請扮演AI運動教練， 你的名字是\"Hermes\"" {
                                        HStack {
                                            if i.user != "ai" {
                                                Spacer()
                                            }
                                            Group {
                                                Markdown(i.message)
                                                    .colorScheme(.dark)
                                                    .padding(10)
                                                    .background((i.user == "ai") ? .green : .blue )
                                                    .cornerRadius(10)
                                            }
                                            if i.user == "ai" {
                                                Spacer()
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        HStack {
                            TextField("Type message here", text: $messageFild)
                                .onSubmit {
                                    if loading == false {
                                        sendMessage()
                                    }
                                }
                            Button("發送") {
                                if loading == false {
                                    sendMessage()
                                }
                            }
                            .padding(10)
                            .foregroundColor(.white)
                            .background(loading ? .gray : .blue)
                            .cornerRadius(10)
                            .disabled(loading)
                            
                        }
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                        
                    } else {
                        if notsupport {
                            Text("你所在國家和地區不支援")
                                .font(.largeTitle)
                        } else {
                            Text("連接中。。。")
                                .font(.largeTitle)
                        }
                    }
                }
                
                .onAppear() {
                    if messages.count == 0 {
                        loading = true
                        let temp = "請扮演AI運動教練， 你的名字是\"Hermes\""
                        let temp1 = messages
                        messages.append(chatMessage(user: "user", message: temp, time: Date()))
                        
                        let config = GenerationConfig(
                            temperature: 0.9,
                            topP: 1,
                            topK: 0,
                            maxOutputTokens: 2048,
                            responseMIMEType: "text/plain"
                        )
                        
                        // Don't check your API key into source control!
                        guard let apiKey = ProcessInfo.processInfo.environment["GEMINI_API_KEY"] else {
                            fatalError("Add GEMINI_API_KEY as an Environment Variable in your app's scheme.")
                        }
                        
                        let model = GenerativeModel(
                            name: "gemini-1.0-pro",
                            apiKey: apiKey,
                            generationConfig: config
                        )
                        
                        var allHistory: [ModelContent] = []
                        for i in temp1 {
                            var username = i.user
                            if username == "ai" {
                                username = "model"
                            } else {
                                username = "user"
                            }
                            allHistory.append(
                                ModelContent(
                                    role: username,
                                    parts: [
                                        .text(i.message)
                                    ]
                                ))
                        }
                        let chat = model.startChat(history: allHistory)
                        
                        Task {
                            do {
                                let message = temp
                                let response = try await chat.sendMessage(message)
                                let ans = response.text ?? "No response received"
                                messages.append(chatMessage(user: "ai", message: ans, time: Date()))
                                loading = false
                                firstLoading = false
                            } catch {
                                messages.append(chatMessage(user: "ai", message: "Error: \(error)", time: Date()))
                                if "\(error)" == "unsupportedUserLocation" {
                                    notsupport = true
                                }
                                loading = false
                                firstLoading = false
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("Hermes")
        }
    }
    
    func sendMessage() -> Void {
        loading = true
        let temp = messageFild
        if temp == "" {
            loading = true
            return
        }
        let temp1 = messages
        messageFild = ""
        messages.append(chatMessage(user: "user", message: temp, time: Date()))
        
        let config = GenerationConfig(
            temperature: 0.9,
            topP: 1,
            topK: 0,
            maxOutputTokens: 2048,
            responseMIMEType: "text/plain"
        )
        
        // Don't check your API key into source control!
        guard let apiKey = ProcessInfo.processInfo.environment["GEMINI_API_KEY"] else {
            fatalError("Add GEMINI_API_KEY as an Environment Variable in your app's scheme.")
        }
        
        let model = GenerativeModel(
            name: "gemini-1.0-pro",
            apiKey: apiKey,
            generationConfig: config
        )
        
        var allHistory: [ModelContent] = []
        for i in temp1 {
            var username = i.user
            if username == "ai" {
                username = "model"
            } else {
                username = "user"
            }
            allHistory.append(
                ModelContent(
                    role: username,
                    parts: [
                        .text(i.message)
                    ]
                ))
        }
        let chat = model.startChat(history: allHistory)
        
        Task {
            do {
                let message = temp
                let response = try await chat.sendMessage(message)
                let ans = response.text ?? "No response received"
                messages.append(chatMessage(user: "ai", message: ans, time: Date()))
                loading = true
            } catch {
                messages.append(chatMessage(user: "ai", message: "Error: \(error)", time: Date()))
                loading = true
            }
            
        }
        
    }
}

struct chatMessage: Identifiable {
    let id = UUID()
    let user: String
    let message: String
    let time: Date
}



struct CoachView_Previews: PreviewProvider {
    static var previews: some View {
        CoachView()
    }
}


