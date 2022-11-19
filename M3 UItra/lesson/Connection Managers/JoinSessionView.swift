

import SwiftUI

struct JoinSessionView: View {
  @ObservedObject private var chatConnectionManager = ChatConnectionManager()
  var body: some View {
      NavigationView {
          VStack {
              if chatConnectionManager.connectedToChat {
                  ChatView()
                      .environmentObject(chatConnectionManager)
              } else {
                  if getdata().getdefaultsdatabool(type: "teachermode") {
                      Button(action: {
                          chatConnectionManager.join()
                      }, label: {
                          Color.orange
                              .frame(width: 340, height: 240)
                              .cornerRadius(15)
                              .padding()
                              .shadow(radius: 10)
                              .overlay() {
                                  ZStack {
                                      VStack {
                                          Spacer()
                                          HStack {
                                              Spacer()
                                              Text("\(NSLocalizedString("開始課堂", comment: "開始課堂"))")
                                                  .foregroundColor(.white)
                                                  .font(.title)
                                                  .bold()
                                                  .padding(25)
                                          }
                                      }
                                      
                                  }
                              }
                      })
                  } else {
                      Button(action: {
                          chatConnectionManager.host()
                      }, label: {
                          Color.orange
                              .frame(width: 340, height: 240)
                              .cornerRadius(15)
                              .padding()
                              .shadow(radius: 10)
                              .overlay() {
                                  ZStack {
                                      VStack {
                                          Spacer()
                                          HStack {
                                              Spacer()
                                              Text("\(NSLocalizedString("連接課堂", comment: "連接課堂"))")
                                                  .foregroundColor(.white)
                                                  .font(.title)
                                                  .bold()
                                                  .padding(25)
                                          }
                                      }
                                      
                                  }
                              }
                      })
                      
                  }
              }
          }
          
      }
      
      .navigationViewStyle(StackNavigationViewStyle())

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
