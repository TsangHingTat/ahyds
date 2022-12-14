//
//  settingsView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI
import AVFoundation

struct settingsView: View {
    let defaults = UserDefaults.standard
    @State var username = "USERNAME"
    @State var notifyon = false
    @State var showwelcome = false
    @Binding var refresh: Bool
    
    @State var health = Float(0)
    
    @State var clear = false
    
    @State var developermode = 10
    @State var showAlert = false
    @State var showAlert2 = false
    
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: usernameView(username: $username, refresh: $refresh)) {
                        HStack {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack {
                                HStack {
                                    Text(username)
                                        .font(.title3)
                                    Spacer()
                                }
                                HStack {
                                    Text("設定你的名稱")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                Section {
                    NavigationLink(destination: healthView(refresh: $refresh)) {
                        HStack {
                            Image(systemName: "heart")
                            Text("健康")
                        }
                    }
                    
                    
                }
                #if DEBUG
                Section {
                    NavigationLink(destination: notifyView(notifyon: $notifyon)) {
                        HStack {
                            Image(systemName: "bell.circle")
                            Text("通知")
                        }
                    }
                    
                    
                }
                #endif
                

                
                Section {
                    NavigationLink(destination: langView()) {
                        HStack {
                            Image(systemName: "globe")
                            Text("語言")
                        }
                    }
                    
                    
                }
//                Section {
//                    NavigationLink(destination: supportView().navigationBarTitle("支援")) {
//                        HStack {
//                            Image(systemName: "questionmark.circle")
//                            Text("支援")
//                            Spacer()
//                        }
//                    }
//                    
//                    
//                }
                
                Section {
                    Button(action: {
                        if developermode == 0 {
                            showAlert2 = true
                        } else if developermode == 1 {
                            showAlert = true
                            developermode = developermode - 1
                        } else {
                            developermode = developermode - 1
                        }
                    }, label: {
                        HStack {
                            Text("版本:")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Spacer()
                            Text(UIApplication.appVersion ?? "")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                        }
                    })
                    
                    NavigationLink(destination: infoView()) {
                        HStack {
                            Text("版本資訊")
                        }
                    }
                    
                    
                }
                Section {
                    NavigationLink(destination: WebView(url: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSe6Z_yDtXuK-ARoWycvXWmWZyBPG0-Va5ajDeEgy6gMlLAlGw/viewform?usp=sf_link")!).navigationBarTitleDisplayMode(.inline)) {
                        Text("建議反饋")
                    }
                }
                

                
                
                Group {
                    if developermode == 0 {
                        Section {
                            NavigationLink(destination: developerView(refresh: $refresh)) {
                                Text("開發人員選項")
                            }
                        }
                        
                    }
                }
                Section(header: Text("清除所有數據")) {
                    Button(action: {
                        clear = true
                    }, label: {
                        HStack {
                            Spacer()
                            Text("清除此應用的所有數據")
                                .foregroundColor(.red)
                            Spacer()
                        }
                    })
                }
                
                
                
            }
            .navigationTitle("設定")
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        .onAppear() {
            username = defaults.string(forKey: "username") ?? "USERNAME"
            notifyon = defaults.bool(forKey: "notifyon")
            health = defaults.float(forKey: "health")
            
            
        }
        
        .alert("恭喜你, 你已經成為開發人員 !", isPresented: $showAlert, actions: {
                    Button("完成") { }
        })
        .alert("不需要了, 你已經是開發人員 !", isPresented: $showAlert2, actions: {
            Button("取消開發人員模式") {
                developermode = 10
            }
            Button("好") {
            }
               
        })
        .alert("清除此應用的所有數據，是否繼續 ?", isPresented: $clear, actions: {
            Button("取消") {
                
            }
            Button("是") {
                let dictionary = defaults.dictionaryRepresentation()
                dictionary.keys.forEach { key in
                    defaults.removeObject(forKey: key)
                }
                refresh = true
                exit(-1)
                
                
            }
            
        })
        
        
    }
    
}



struct infoView: View {
    var body: some View {
        List {
            Section {
                VStack {
                    HStack {
                        Text("版本:")
                            .bold()
                            .font(.title3)
                        Text("\(UIApplication.appVersion ?? "")")
                            .bold()
                            .font(.title3)
                        Spacer()
                    }
                    
                }
                HStack {
                    Text("此更新包括改進和錯誤修復")
                    Spacer()
                }
                    
            }
            Section {
                Section {
                    Text("Copyright © 2022 TsangHingTat")
                    Text("Copyright © 2022 Tse Pok Fun")
                }
            }
        }
        .navigationTitle("版本資訊")
    }

}
