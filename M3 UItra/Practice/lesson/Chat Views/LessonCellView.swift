

import SwiftUI

struct ChatView: View {
  @EnvironmentObject var chatConnectionManager: ChatConnectionManager
  @State private var messageText = ""
  @State var showperson = false
  @State var connected = false
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  var body: some View {
    Group {
        if chatConnectionManager.isHosting == true {
            if connected == true {
                studentView()
                    .environmentObject(chatConnectionManager)
            } else {
                VStack {
                    Text("正在等待連線")
                        .bold()
                        .font(.largeTitle)
                        .padding()
                    Text("你的名稱: \(getdata().getdefaultsdata(type: "username"))")
                        .padding()
                    ProgressView()
                        .padding()
                }
            }
            
        } else {
            VStack {
              ChatListView()
                .environmentObject(chatConnectionManager)
            }
            .navigationBarTitle("課堂")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("離開") {
                        chatConnectionManager.leaveChat()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("學生") {
                        showperson.toggle()
                    }
                }
            }
        }
          
    }
    .onReceive(timer) { input in
        if connected != true {
            for i in (chatConnectionManager.messages) {
                if i.body == "start" {
                    connected = true
                }
            }
        }
    }
    .navigationBarBackButtonHidden(true)
    .sheet(isPresented: $showperson) {
      NavigationView {
        VStack {
          List(chatConnectionManager.peers, id: \.self) { peer in
            Text(peer.displayName)
              .padding(.all, 6)
              .font(Font.body.bold())
              .cornerRadius(9)
          }
          .navigationTitle("已接連的學生")
        }
      }
    }
  }

}

#if DEBUG
import MultipeerConnectivity
struct ChatView_Previews: PreviewProvider {
  static let chatConnectionManager = ChatConnectionManager()

  static var previews: some View {
    NavigationView {
      ChatView()
        .environmentObject(chatConnectionManager)
        .onAppear {
          chatConnectionManager.peers.append(MCPeerID(displayName: "Test Peer"))
          chatConnectionManager.isHosting = true
        }
    }
  }
}
#endif




//import SwiftUI
//
//struct ChatView: View {
//  @EnvironmentObject var chatConnectionManager: ChatConnectionManager
//  @State private var messageText = ""
//
//  var body: some View {
//    VStack {
//      chatInfoView
//      ChatListView()
//        .environmentObject(chatConnectionManager)
//      messageField
//    }
//    .navigationBarTitle("Lesson", displayMode: .inline)
//    .toolbar {
//      ToolbarItem(placement: .navigationBarLeading) {
//        Button("Leave") {
//          chatConnectionManager.leaveChat()
//        }
//      }
//    }
//    .navigationBarBackButtonHidden(true)
//  }
//
//  private var messageField: some View {
//    VStack(spacing: 0) {
//      Divider()
//      // swiftlint:disable:next trailing_closure
//      TextField("Enter Message", text: $messageText, onCommit: {
//        guard !messageText.isEmpty else { return }
//        chatConnectionManager.send(messageText)
//        messageText = ""
//      })
//      .padding()
//    }
//  }
//
//  private var chatInfoView: some View {
//    VStack(alignment: .leading) {
//      Divider()
//      HStack {
//        Text("People in chat:")
//          .fixedSize(horizontal: true, vertical: false)
//          .font(.headline)
//        if chatConnectionManager.peers.isEmpty {
//          Text("Empty")
//            .font(Font.caption.italic())
//            .foregroundColor(Color("rw-dark"))
//        } else {
//          chatParticipants
//        }
//      }
//      .padding(.top, 8)
//      .padding(.leading, 16)
//      Divider()
//    }
//    .frame(height: 44)
//  }
//
//  private var chatParticipants: some View {
//    ScrollView(.horizontal, showsIndicators: false) {
//      HStack {
//        ForEach(chatConnectionManager.peers, id: \.self) { peer in
//          Text(peer.displayName)
//            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 6)
//            .background(Color("rw-dark"))
//            .foregroundColor(.white)
//            .font(Font.body.bold())
//            .cornerRadius(9)
//        }
//      }
//    }
//  }
//}
//
//#if DEBUG
//import MultipeerConnectivity
//struct ChatView_Previews: PreviewProvider {
//  static let chatConnectionManager = ChatConnectionManager()
//
//  static var previews: some View {
//    NavigationView {
//      ChatView()
//        .environmentObject(chatConnectionManager)
//        .onAppear {
//          chatConnectionManager.peers.append(MCPeerID(displayName: "Test Peer"))
//        }
//    }
//  }
//}
//#endif
