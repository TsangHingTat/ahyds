//
//  GroupAdminListView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 5/11/2022.
//


import SwiftUI
import Combine

struct GroupAdminListView: View {
    @EnvironmentObject var chatConnectionManager: ChatConnectionManager
    @State var worksheet = false
    @State var names = [""]
    @State var yo = ""
    @State var hour = "0"
    @State var min = "0"
    @State var s = "15"
    @State var ss = false
    @State var sel = ""
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: {
                        worksheet.toggle()
                    }) {
                        HStack {
                            Spacer()
                            Text("發放練習")
                                .font(.headline)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(15)
                }
                .padding()
                
                VStack {
                    ForEach(chatConnectionManager.messages) { i in
                        HStack {
                            Color.orange
                                .frame(height: 120)
                                .cornerRadius(25)
                                .overlay() {
                                    VStack {
                                        HStack {
                                            Text("\(i.displayName)")
                                                .font(.title2)
                                                .bold()
                                                .padding()
                                            Spacer()
                                        }
                                        Spacer()
                                        HStack {
                                            Text("\(DateFormatter.timestampFormatter.string(from: i.time))")
                                                .font(.title2)
                                                .padding()
                                            Spacer()
                                            Text("\(i.body)")
                                                .font(.title2)
                                                .padding()
                                        }
                                    }
                                }
                        }
                        .padding(.horizontal)
                    }
                }
                //here
            }
        }
        .onDisappear() {
//            let yo2 = Int(yo) ?? 0
//            GetData().savedefaultsdataint(type: "yo", data: yo2)
//            let hour2 = Int(hour) ?? 0
//            GetData().savedefaultsdataint(type: "hour", data: hour2)
//            let min2 = Int(min) ?? 0
//            GetData().savedefaultsdataint(type: "min", data: min2)
//            let s2 = Int(s) ?? 0
//            GetData().savedefaultsdataint(type: "s", data: s2)
//            GetData().savedefaultsdatabool(type: "ss", data: ss)
        }
        .onAppear() {
            chatConnectionManager.send("start")
            chatConnectionManager.messages.removeLast()
//            yo = String(GetData().getdefaultsdataint(type: "yo"))
//            hour = String(GetData().getdefaultsdataint(type: "hour"))
//            min = String(GetData().getdefaultsdataint(type: "min"))
//            s = String(GetData().getdefaultsdataint(type: "s"))
//            ss = GetData().getdefaultsdatabool(type: "ss")
        }
        .sheet(isPresented: $worksheet) {
            NavigationView {
                VStack {
                    NavigationLink(destination: secview.onAppear() { sel = "1" }) {
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
                                            Text("\(NSLocalizedString("仰臥起坐", comment: "仰臥起坐"))")
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
                    NavigationLink(destination: secview.onAppear() { sel = "2" }) {
                        Image("掌上壓")
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
                                            Text("\(NSLocalizedString("掌上壓", comment: "掌上壓"))")
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
                }
                .navigationTitle("發放練習")
                .toolbar() {
                    Button("取消") {
                        worksheet.toggle()
                    }
                }
                
            }
            .interactiveDismissDisabled(true)
        }
//        .sheet(isPresented: $worksheet) {
//            List {
//                Section {
//                    Text("仰臥起坐")
//                    Button(action: {
//                        chatConnectionManager.send("start sport sit-up")
//                        chatConnectionManager.messages.removeLast()
//                    }, label: {
//                        Text("開始")
//                    })
//                }
//                Section {
//                    Text("掌上壓")
//                    Button(action: {
//                        chatConnectionManager.send("start sport pushup")
//                        chatConnectionManager.messages.removeLast()
//                    }, label: {
//                        Text("開始")
//                    })
//                }
//                Section {
//                    Button(action: {
//                        chatConnectionManager.send("stop sport")
//                        chatConnectionManager.messages.removeLast()
//                    }, label: {
//                        Text("停止")
//                    })
//                }

//                    HStack {
//                        Toggle(isOn: $ss) {
//                            Text("time limit")
//                        }
//                    }
//                }
//            }
//        }
    }
    var secview: some View {
        VStack {
            List {
//                Section {
//                    HStack {
//                        Text("duration : ")
//                        TextEditor(text: $yo)
//                            .keyboardType(.numberPad)
//                            .onReceive(Just(yo)) { newValue in
//                                let filtered = newValue.filter { "0123456789".contains($0) }
//                                if filtered != newValue {
//                                    self.yo = filtered
//                                }
//                            }
//                    }
//                }
                let space = CGFloat(230)
                Section {
//                    HStack {
//                        Text("times")
//                    }
                    HStack {
                        Text("分鐘: ")
                        Spacer()
                        TextEditor(text: $min)
                            .lineLimit(1)
                            .frame(width: space)
                            .keyboardType(.numberPad)
                            .onReceive(Just(min)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.min = filtered
                                }
                            }
                    }
                    HStack {
                        Text("秒: ")
                        Spacer()
                        TextEditor(text: $s)
                            .lineLimit(1)
                            .frame(width: space)
                            .keyboardType(.numberPad)
                            .onReceive(Just(s)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.s = filtered
                                }
                            }
                    }
                }
                Section {
                    HStack {
                        NavigationLink(destination: TimerView(timeRemaining: Int(Int(Int(Int(min) ?? 0)*60)+Int(Int(s) ?? 0)), on: $worksheet)
                            .environmentObject(chatConnectionManager)
                            .onAppear() {
                                if sel == "1" {
                                    chatConnectionManager.send("start sport sit-up")
                                    chatConnectionManager.messages.removeLast()
                                } else if sel == "2" {
                                    chatConnectionManager.send("start sport pushup")
                                    chatConnectionManager.messages.removeLast()
                                }
                            }) {
                                HStack {
                                    Spacer()
                                    Text("發放練習")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                            
                        }
                        .frame(height: 50)
                        .background(Color.blue)
                        .cornerRadius(15)
                    }
                }
            }
            .navigationTitle("設定")
        }
    }
}



struct GroupAdminListView_Previews: PreviewProvider {
  static var previews: some View {
    GroupAdminListView(worksheet: true)
      .environmentObject(ChatConnectionManager())
  }
}
