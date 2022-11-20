//
//  usernameView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 19/8/2022.
//

import SwiftUI

struct usernameView: View {
    let defaults = UserDefaults.standard
    @State var showwelcome = false
    @State var teachermode =  false
    
    @Binding var username: String
    
    @Binding var refresh: Bool
    var body: some View {
        List {
            Section {
                HStack {
                    Text("你的名稱：")
                    TextEditor(text: $username)
                }
            }
            Section {
                HStack {
                    Toggle(isOn: $showwelcome) {
                        Text("在主頁顯示歡迎及其他訊息")
                    }
                }
            }
            Section {
                HStack {
                    Toggle(isOn: $teachermode) {
                        Text("教師模式")
                    }
                }
            }
            .navigationTitle("名稱設定")
        }
        
        .onDisappear() {
            defaults.set(username, forKey: "username")
            defaults.set(showwelcome, forKey: "showwelcome")
            defaults.set(teachermode, forKey: "teachermode")
            refresh = true

        }
        .onAppear() {
            showwelcome = defaults.bool(forKey: "showwelcome")
            teachermode = defaults.bool(forKey: "teachermode")
        }
    }
}

class ContentViewModel: ObservableObject {
    @Published var refresh = false
}

