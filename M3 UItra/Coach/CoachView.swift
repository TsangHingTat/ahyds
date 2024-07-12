//
//  CoachView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 7/12/24.
//

import SwiftUI
import GoogleGenerativeAI

struct CoachView: View {
    @State var messages: [chatMessage] = []
    @State var messageFild = ""
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(messages) { i in
                        HStack {
                            if i.user != "ai" {
                                Spacer()
                            }
                            Text(i.message)
                                .foregroundColor(.white)
                                .padding(10)
                                .background((i.user == "ai") ? .green : .blue )
                                .cornerRadius(10)
                            if i.user == "ai" {
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                HStack {
                    TextField("Type message here", text: $messageFild)
                        .onSubmit {
                            sendMessage()
                        }
                    Button("發送") {
                        sendMessage()
                    }
                    .foregroundColor(.white)
                    .padding(8)
                    .background(.blue)
                    .cornerRadius(10)
                    
                }
                .padding()
            }
        }
        .navigationTitle("AI 教練")
    }
    
    func sendMessage() -> Void {
        let temp = messageFild
        if temp == "" {
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
            } catch {
                messages.append(chatMessage(user: "ai", message: "Error: \(error)", time: Date()))
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


