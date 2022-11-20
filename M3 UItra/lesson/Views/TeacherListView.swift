

import SwiftUI

struct ChatListView: View {
  @EnvironmentObject var chatConnectionManager: ChatConnectionManager
  @State var worksheet = false
  var body: some View {
      List {
          Button("發放練習") {
              worksheet.toggle()
          }
          Section {
              ForEach(chatConnectionManager.messages) { message in
                HStack {
                  Text("\(message.displayName)\(DateFormatter.timestampFormatter.string(from: message.time)) \(message.body)")
                }
                
              }
          }
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
}
