//
//  JoinSessionView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 5/11/2022.
//

import SwiftUI

struct JoinSessionView: View {
    @ObservedObject private var chatConnectionManager = ChatConnectionManager()
    @State var refresh = false
    var body: some View {
        VStack {
            VStack {
                if refresh {
                    Refreshhelper(refresh: $refresh)
                } else {
                    if chatConnectionManager.connectedToChat {
                        ChatView()
                            .environmentObject(chatConnectionManager)
                    } else {
                        if GetData().getdefaultsdatabool(type: "teachermode") {
                            Button(action: {
                                chatConnectionManager.join()
                            }, label: {
                                Image("classroomView")
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
                                                    Spacer()
                                                    Text("\(NSLocalizedString("開始課堂", comment: "開始課堂"))")
                                                        .foregroundColor(.black)
                                                        .font(.title)
                                                        .bold()
                                                        .padding(25)
                                                }
                                            }
                                            
                                        }
                                    }
                            })
                            Button(action: {
                                chatConnectionManager.join()
                            }, label: {
                                Image("aa")
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
                                                    Spacer()
                                                    Text("\(NSLocalizedString("開始團體模式", comment: "開始團體模式"))")
                                                        .foregroundColor(.black)
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
                                Image("classroomView")
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
                                                    Spacer()
                                                    Text("\(NSLocalizedString("連接課堂", comment: "連接課堂"))")
                                                        .foregroundColor(.black)
                                                        .font(.title)
                                                        .bold()
                                                        .padding(25)
                                                }
                                            }
                                            
                                        }
                                    }
                            })
                            Button(action: {
                                chatConnectionManager.host()
                            }, label: {
                                Image("aa")
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
                                                    Spacer()
                                                    Text("\(NSLocalizedString("進入團體模式", comment: "進入團體模式"))")
                                                        .foregroundColor(.black)
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
            
        }
        //      .onAppear() {
        //          refresh = true
        //          if GetData().getdefaultsdatabool(type: "teachermode") != true {
        //              chatConnectionManager.host()
        //          }
        //      }
        
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
