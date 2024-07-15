//
//  practiceView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

// MARK: 訓練頁面的控制器
struct PracticeView: View {
    @State var view = true
    @State var size = CGFloat(160)
    var body: some View {
        ZStack {
            NavigationView {
                TrainView()
                    .navigationTitle("訓練")
           
            }
            
            .navigationViewStyle(.stack)
        }

        
    }
    #if DEBUG
    func notify() -> Void {
        let content = UNMutableNotificationContent()
        content.title = "DEBUG"
        content.body = "Debug mode turned on."
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)

        NSLog("All set!")
    }
    #endif
}



struct practiceView_Preview: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}





