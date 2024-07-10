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
    @State var ddd = "https://bit.ly/3GRJIFl"
    var body: some View {
        ZStack {
//            WebView(url: URL(string: "\(ddd)")!)
            TabView(selection: $selection) {
                Group {
                    if refresh {
                        refreshhelper(refresh: $refresh)
                    } else {
                        homeView(welcome: $welcome)
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
            .interactiveDismissDisabled(true)
        }
        .onAppear() {
            if getdata().getdefaultsdata(type: "firstopen1.1") != UIApplication.appVersion {
                welcome = true
            }
        }
        #if DEBUG
        .onAppear() {
            ddd = "https://google.com"
        }
        #endif
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



struct testView: View {
    var body: some View {
        let j = done_and_non_done().done_and_non_done(type_of_sport: "pushup")
        let f = done_and_non_done().done_and_non_done(type_of_sport: "sit-up")

        VStack {
            Text(getdata().getdata(date: "2022-11-17", datanum: 5))
            if j {
                Text("true")
            }
            Text("")
        }
        .onAppear() {
            if j {
              //  getdata().notification(title: "why", subtitle: "j")
            }
            if f {
             //   getdata().notification(title: "f", subtitle: "f")
            }
        }
    }
}
