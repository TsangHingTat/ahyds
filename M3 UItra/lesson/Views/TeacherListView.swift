

import SwiftUI

struct ChatListView: View {
    @EnvironmentObject var chatConnectionManager: ChatConnectionManager
    @State var worksheet = false
    @State var names = [""]
    var body: some View {
        VStack {
            Button("發放練習") {
                worksheet.toggle()
            }
            //here
            // chatConnectionManager.messages.displayName
            // chatConnectionManager.messages.body
            VStack {
                ForEach(chatConnectionManager.messages) { i in
                    HStack {
                        Text(i.displayName)
                        Text("\(DateFormatter.timestampFormatter.string(from: i.time))")
                        Text(i.body)
                    }
                }
            }
            //here
        }
        .onAppear() {
            chatConnectionManager.send("start")
            chatConnectionManager.messages.removeLast()
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
            }
        }
    }
    func name(name: String) -> Void {
        
    }
}
