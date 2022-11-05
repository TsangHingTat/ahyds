

import SwiftUI

struct ChatListView: View {
  @EnvironmentObject var chatConnectionManager: ChatConnectionManager

  var body: some View {
    List(chatConnectionManager.messages) { message in
      HStack {
        Text("\(message.displayName) 在 \(DateFormatter.timestampFormatter.string(from: message.time)) \(message.body)")
      }
        
    }
  }
}

#if DEBUG
struct ChatListView_Previews: PreviewProvider {
  static var previews: some View {
    ChatListView()
      .environmentObject(ChatConnectionManager())
  }
}
#endif
