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
    @State var sub = false
    @State var howmanytimes = ""
    var body: some View {
        ScrollView(showsIndicators: false) {
            Button(action: {
                view = true
            }) {
                Image("仰臥起坐")
                    .resizable()
                    .frame(width: 340, height: 240)
                    .cornerRadius(15)
                    .padding()
                    .shadow(radius: 10)
                    .overlay() {
                        ZStack {
                            VStack {
                                Spacer()
                                HStack {
                                    Text("仰臥起坐")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .bold()
                                        .padding(25)
                                    Spacer()
                                }
                            }
                            
                        }
                    }
            }
            .fullScreenCover(isPresented: $view) {
                stuaiView(onoff: $view, title: "仰臥起坐", sub: $sub, howmanytimes: $howmanytimes)
            }
            
            .onReceive(timer) { timer in
                if sub == true {
                    chatConnectionManager.send("仰臥起坐 X \(howmanytimes)")
                    sub = false
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
    @Binding var sub: Bool
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
                }
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar() {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            onoff = false
                            howmanytimes = action
                            sub = true
                        }, label: {
                            Text("退出")
                        })
                    }
                }
        }
        
        .onReceive(timer) { timer in
            action = getdata().getdefaultsdata(type: "howmanytimes?")
        }
    }
}


