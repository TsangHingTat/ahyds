

import SwiftUI

struct JoinSessionView: View {
  @ObservedObject private var chatConnectionManager = ChatConnectionManager()
  var body: some View {
    VStack(spacing: 24) {
      Button(action: {
        chatConnectionManager.join()
      }, label: {
          Rectangle()
              .frame(width: 350,height: 100)
              .cornerRadius(30)
              .foregroundColor(.green)
              .overlay() {
                  Text("開始課堂")
                      .font(.largeTitle)
                      .foregroundColor(.black)
                      .bold()
              }
      })
      Button(action: {
        chatConnectionManager.host()
      }, label: {
          Rectangle()
              .frame(width: 350,height: 100)
              .cornerRadius(30)
              .foregroundColor(.green)
              .overlay() {
                  Text("連接課堂")
                      .font(.largeTitle)
                      .foregroundColor(.black)
                      .bold()
              }
      })
      NavigationLink(
        destination: ChatView()
          .environmentObject(chatConnectionManager),
        isActive: $chatConnectionManager.connectedToChat) {
          EmptyView()
      }
    }
    .navigationTitle("課堂")
  }
}

#if DEBUG
struct JoinSessionView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      JoinSessionView()
    }
  }
}
#endif
