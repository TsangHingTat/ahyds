//
//  studentView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 5/11/2022.
//

import SwiftUI

struct studentView: View {
    @EnvironmentObject var chatConnectionManager: ChatConnectionManager
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State var view = false
    @State var howmanytimes = ""
    @Binding var leave: Bool
    var body: some View {
        VStack {
            Text("已連接課堂")
                .bold()
                .font(.largeTitle)
                .padding()
            Button("離開") {
                leave = true
            }
        }
        
        .fullScreenCover(isPresented: $view) {
            stuaiView(onoff: $view, title: "仰臥起坐", howmanytimes: $howmanytimes)
        }
        
        .onReceive(timer) { input in
            if view != true {
                for i in (0...chatConnectionManager.messages.count-1) {
                    if chatConnectionManager.messages[i].body == "start sport 30324290" {
                        getdata().savedefaultsdata(type: "mlmodel", data: "push-up")
                        chatConnectionManager.messages.remove(at: i)
                        view = true
                        howmanytimes = "0"
                    }
                }
            } else {
                for i in (0...chatConnectionManager.messages.count-1) {
                    if chatConnectionManager.messages[i].body == "stop sport 30324290" {
                        chatConnectionManager.messages.remove(at: i)
                        chatConnectionManager.send("仰臥起坐 X \("\(getdata().getdefaultsdataint(type: "howmanytimes?"))")")
                        view = false
                        howmanytimes = "0"
                    }
                }
            }
        }
        
    }
}

struct stuaiView: View {
    @State var action = "loading"
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @Binding var onoff: Bool
    @State var title: String
    @Binding var howmanytimes: String
    var barView: some View {
            VStack {
                Spacer()
                VStack {
                    Spacer()
                    Rectangle()
                        .foregroundColor(Color(red: 0, green: 60/255, blue: 0))
                        .frame(width: 360, height: 120)
                        .cornerRadius(30)
                        .padding()
                        .overlay() {
                            Group {
                                Text("Point: \(action)")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        }
                    
                }
                
            }
        }
    var body: some View {
        NavigationView {
            ZStack {
                CameraSelfView()
                barView
                dpView()
            }
                .onAppear() {
                    getdata().savedefaultsdataint(type: "howmanytimes?", data: 0)
                    action = "0"
                }
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
        }
        
        .onReceive(timer) { timer in
            action = "\(getdata().getdefaultsdataint(type: "howmanytimes?"))"
        }
    }
}


