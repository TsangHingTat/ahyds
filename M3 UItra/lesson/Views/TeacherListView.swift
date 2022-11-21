

import SwiftUI

struct ChatListCellView: View {
    var bodymessage: Array<Any>
    var body: some View {
        VStack {
            List {
                
            }
        }
    }
    func getbody(string: String) -> Int {
        
        return 0
    }
}

struct ChatListView: View {
  @EnvironmentObject var chatConnectionManager: ChatConnectionManager
  @State var worksheet = false
  var body: some View {
      VStack {
          Button("發放練習") {
              worksheet.toggle()
          }
          Group {
              VStack {
                  ChatListCellView(bodymessage: chatConnectionManager.messages)
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
