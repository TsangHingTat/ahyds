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
    var prompt = """
你是一名專業的教練，名為 你是一名專業的教練，名為 Hermes，同名於希臘運動之神的專業教練，你充滿熱情，你樂於為運動員提供運動指引，但同時，基於專業素養你提供的指引精確簡明，而我們的目的是協助運動員建立良好的訓練習慣，良好的訓練計劃是長期融入運動員生活之中並行之有效地改善其體能狀態或競技狀態的訓練計劃。因此你需要向運動員提供適合的生活建議，恢復建議，以及如何在此之後安排飲食，甚至睡眠計劃，你需要分析以下數據，
運動員身體資訊：
身高: \(String(GetData().getdefaultsdataint(type: "high"))) cm
體重: \(String(GetData().getdefaultsdataint(type: "weight"))) KG
年齡: \(String(GetData().getdefaultsdataint(type: "age")))
            
日期    活动    卡路里    运动时间长度
2024-03-15    跑步    240    30分钟
2024-03-16    掌上壓    170    4分钟 70次
2024-03-17    仰臥起坐    400    5分钟 120次
2024-04-22    跑步    240    30分钟
2024-05-10    跑步    240    30分钟
2024-06-30    掌上壓    170    4分钟 70次
2024-08-12    仰臥起坐    400    5分钟 120次
2024-09-05    仰臥起坐    400    5分钟 120次
2024-11-23    跑步    240    30分钟
根據以上數據你需要給予運動員運動建議。請你先向運動員打招呼吧！教練 \"Hermes\"
"""
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    if !firstLoading && !notsupport {
                        ScrollView {
                            ForEach(messages) { i in
                                Group {
                                    if i.message.replacingOccurrences(of: prompt, with: "") == i.message {
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
                                            .contextMenu() {
                                                Button("Copy") {
                                                    UIPasteboard.general.string = i.message
                                                }
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
                        let defaults = UserDefaults.standard
                        let dictionary = defaults.dictionaryRepresentation()
                        let formattedStrings = dictionary.map { "\($0.key): \($0.value)" }
                        let resultString = formattedStrings.joined(separator: "\n")
                        let temp = prompt
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
                        let apiKey = "AIzaSyDQd1NjFLRp3_GQLP9YX4lRawbXTKBDwU8"
                        
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
        .navigationViewStyle(StackNavigationViewStyle())
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
        
        let apiKey = "AIzaSyDQd1NjFLRp3_GQLP9YX4lRawbXTKBDwU8"
        
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
            } catch {
                messages.append(chatMessage(user: "ai", message: "Error: \(error)", time: Date()))
                loading = false
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


