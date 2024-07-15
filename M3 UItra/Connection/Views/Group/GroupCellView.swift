//
//  GroupCellView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 5/11/2022.
//

import SwiftUI

struct GroupCellView: View {
  @EnvironmentObject var chatConnectionManager: ChatConnectionManager
  @State private var messageText = ""
  @State var showperson = false
  @State var connected = false
  @State var leave = false
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  var body: some View {
    Group {
        if chatConnectionManager.isHosting {
            if connected {
                StudentView(leave: $leave)
                    .environmentObject(chatConnectionManager)
            } else {
                VStack {
                    Text("正在等待連線")
                        .bold()
                        .font(.largeTitle)
                        .padding()
                  //  \(NSLocalizedString("你的名稱:", comment: "你的名稱:"))
                    Text("\(peerid())")
                        .padding()
                    ProgressView()
                        .padding()
                    Button("離開") {
                        chatConnectionManager.leaveChat()
                    }
                }
            }
            if leave {
                Text("loading...")
                    .onAppear() {
                        chatConnectionManager.leaveChat()
                        leave = false
                    }
            }
            
        } else {
            VStack {
              ChatListView()
                .environmentObject(chatConnectionManager)
                .onAppear() {
                    chatConnectionManager.removeall()
                }
            }
            .navigationBarTitle("課堂")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("離開") {
                        chatConnectionManager.send("stop")
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
    
    func peerid() -> String {
        let string = "\(chatConnectionManager.myPeerId)"
        let array = string.components(separatedBy: "DisplayName = ")
        let new = array[1]
        let new2 = new.replacingOccurrences(of: " >", with: "")
        return "\(new2)"
    }

}

