

import SwiftUI
import Combine
struct ChatListView: View {
    @EnvironmentObject var chatConnectionManager: ChatConnectionManager
    @State var worksheet = false
    @State var names = [""]
    @State var yo = ""
    @State var hour = ""
    @State var min = ""
    @State var s = ""
    @State var ss = false
    var body: some View {
        VStack {
            Button("設定") {
                worksheet.toggle()
            }
            .padding()
            
            Button("離開") {
                chatConnectionManager.send("stop0234879385")
                chatConnectionManager.leaveChat()
            }
            .padding()
            
            //here
            // chatConnectionManager.messages.displayName
            // chatConnectionManager.messages.body
            VStack {
                ForEach(chatConnectionManager.messages) { i in
                    Color.orange
                        .frame(width: 300, height: 120)
                        .cornerRadius(25)
                        .overlay() {
                            VStack {
                                HStack {
                                    Text("\(i.displayName)")
                                        .font(.title)
                                        .bold()
                                        .padding()
                                    Spacer()
                                }
                                Spacer()
                                HStack {
                                    Text("\(DateFormatter.timestampFormatter.string(from: i.time))")
                                        .font(.title)
                                        .padding()
                                    Spacer()
                                    Text("\(i.body)")
                                        .font(.title)
                                        .padding()
                                }
                            }
                        }
                }
            }
            //here
        }
        .onDisappear() {
            let yo2 = Int(yo) ?? 0
            getdata().savedefaultsdataint(type: "yo", data: yo2)
            let hour2 = Int(hour) ?? 0
            getdata().savedefaultsdataint(type: "hour", data: hour2)
            let min2 = Int(min) ?? 0
            getdata().savedefaultsdataint(type: "min", data: min2)
            let s2 = Int(s) ?? 0
            getdata().savedefaultsdataint(type: "s", data: s2)
            getdata().savedefaultsdatabool(type: "ss", data: ss)
        }
        .onAppear() {
            chatConnectionManager.send("start")
            chatConnectionManager.messages.removeLast()
            yo = String(getdata().getdefaultsdataint(type: "yo"))
            hour = String(getdata().getdefaultsdataint(type: "hour"))
            min = String(getdata().getdefaultsdataint(type: "min"))
            s = String(getdata().getdefaultsdataint(type: "s"))
            ss = getdata().getdefaultsdatabool(type: "ss")
        }
        .sheet(isPresented: $worksheet) {
            List {
                Text("仰臥起坐")
                Button(action: {
                    chatConnectionManager.send("start sport 30324290")
                    chatConnectionManager.messages.removeLast()
                }, label: {
                    Text("開始")
                })
                Button(action: {
                    chatConnectionManager.send("stop sport 30324290")
                    chatConnectionManager.messages.removeLast()
                }, label: {
                    Text("停止")
                })
                Section {
                    HStack {
                        Text("duration : ")
                        TextEditor(text: $yo)
                            .keyboardType(.numberPad)
                            .onReceive(Just(yo)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.yo = filtered
                                }
                            }
                    }
                }
                let space = CGFloat(230)
                Section {
                    HStack {
                        Text("times")
                    }
                    HStack {
                        Text("hours :")
                        Spacer()
                        TextEditor(text: $hour)
                            .lineLimit(1)
                            .frame(width: space)
                            .keyboardType(.numberPad)
                            .onReceive(Just(hour)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.hour = filtered
                                }
                            }
                    }
                    HStack {
                        Text("min :")
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
                        Text("s :")
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
                    HStack {
                        Toggle(isOn: $ss) {
                            Text("time limit")
                        }
                    }
                }
            }
        }
    }
    func name(name: String) -> Void {
        
    }
}


struct ChatListView_Previews: PreviewProvider {
  static var previews: some View {
    ChatListView(worksheet: true)
      .environmentObject(ChatConnectionManager())
  }
}
