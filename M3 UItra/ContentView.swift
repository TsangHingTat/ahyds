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
                    if refresh {
                        Refreshhelper(refresh: $refresh)
                    } else {
                        HomeView(welcome: $welcome)
                    }
                }
                    .tabItem {
                        Label("主頁", systemImage: "house")
                    }
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color.black, for: .tabBar)
                    .tag(1)
                LessonView()
                    .tabItem {
                        Label("互連", systemImage: "link.circle.fill")
                    }
                    .tag(2)
                CoachView()
                    .tabItem {
                        Label("教練", systemImage: "message")
                    }
                    .tag(3)
                PracticeView()
                    .tabItem {
                        Label("訓練", systemImage: "figure.walk")
                    }
                    .tag(4)
                ScheduleView(refresh: $refresh)
                    .tabItem {
                        Label("日程表", systemImage: "calendar.circle")
                    }
                    .tag(5)
                SettingsView(refresh: $refresh)
                    .tabItem {
                        Label("設定", systemImage: "command.circle")
                    }
                    .tag(6)
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $welcome) {
            WelcomeView(showWelcomeScreen: $welcome)
            .interactiveDismissDisabled(true)
        }
        .onAppear() {
            if GetData().getdefaultsdata(type: "firstopen1.1") != UIApplication.appVersion {
                welcome = true
            }
        }

    }
}


struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


