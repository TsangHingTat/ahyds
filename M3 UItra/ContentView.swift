//
//  ContentView.swift
//  M3 UItra
//
//  Created by M2 Ultra on 11/8/2022.
//

import SwiftUI
import Foundation


// MARK: 分頁控制器
struct ContentView: View {
    @State var welcome = false
    @State var refresh = true
    @State private var selection = 1
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                Group {
                    if refresh == true {
                        refreshhelper(refresh: $refresh)
                    } else {
                        homeView()
                    }
                }
                    .tabItem {
                        Label("主頁", systemImage: "house")
                    }
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color.black, for: .tabBar)
                    .tag(1)
                lessonView()
                    .tabItem {
                        Label("課堂", systemImage: "book")
                    }
                    .tag(2)
                practiceView()
                    .tabItem {
                        Label("訓練", systemImage: "figure.walk")
                    }
                    .tag(3)
                settingsView(refresh: $refresh)
                    .tabItem {
                        Label("設定", systemImage: "command.circle")
                    }
                    .tag(4)
                
            }
        }
        
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $welcome) {
            welcomeView(showWelcomeScreen: $welcome)
        }
        .onAppear() {
            if getdata().getdefaultsdata(type: "firstopen") != UIApplication.appVersion {
                welcome = true
            }
        }
    }
}


// MARK: 重新整理
struct refreshhelper: View {
    let defaults = UserDefaults.standard
    @State var alldatakey = ["ismoved"]
    @State var alldatastring = ["ismoved"]
    @Binding var refresh: Bool
    var body: some View {
        Text("refresh helper")
            .font(.largeTitle)
            .foregroundColor(.white)
            .bold()
            .hidden()
        
        .onAppear() {
            refresh = false
            if getdata().getdefaultsdata(type: "username") == "" {
                getdata().savedefaultsdata(type: "username", data: "USERNAME")
            }
        }
        
    }

}

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



