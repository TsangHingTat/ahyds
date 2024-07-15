//
//  noifyView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 19/8/2022.
//

import SwiftUI
import UserNotifications

struct NotifyView: View {
    let defaults = UserDefaults.standard
    
    @Binding var notifyon: Bool
    
    var body: some View {
        ZStack {
            VStack {
                if notifyon {
                    BackgroundView()
                }
            }
            List {
//                Section {
//                    HStack {
//                        Toggle(isOn: $notifyon) {
//                            Text("允許通知")
//                        }
//                    }
//                }
                
                Section {
                    HStack {
                        Spacer()
                        Button("請求發送測試訊息") {
                            notify()
                        }
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("通知")
        
        .onDisappear() {
            defaults.set(notifyon, forKey: "notifyon")
            print("saved")
        }
    }
    
    func notify() -> Void {
        let content = UNMutableNotificationContent()
        content.title = "測試訊息"
        content.body = "已收到測試請求"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)

        NSLog("All set!")
    }
}

struct BackgroundView: View {
    var body: some View {
        Text("")
            .onAppear() {
                aythorizeNotifications()
            }
    }
    
    func aythorizeNotifications() -> Void {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) {_, _ in
            
        }
    }

    
}

extension Data {
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
}


