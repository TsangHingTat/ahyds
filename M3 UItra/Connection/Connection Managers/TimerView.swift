//
//  TimerView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 7/16/24.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var chatConnectionManager: ChatConnectionManager
    @State var timeRemaining: Int
    @State var main = 0
    @Binding var on: Bool
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Text("\(timeRemaining) 秒")
                .font(.largeTitle)
            ProgressView("", value: Float(timeRemaining), total: Float(main))
                .padding()
        }
        .onAppear() {
            main = timeRemaining
        }
            .onReceive(timer) { time in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
                if timeRemaining == 0 {
                    chatConnectionManager.send("stop sport")
                    chatConnectionManager.messages.removeLast()
                    on = false
                }
            }
            .navigationBarBackButtonHidden(true)
    }
    
}

