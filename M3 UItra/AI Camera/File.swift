//
//  File.swift
//  AI教你做運動
//
//  Created by M2 Ultra on 4/11/2022.
//

import Foundation
import SwiftUI


struct dpView: View {
    let doTime = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    let doTime2 = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State var appear = 0
    @State var time = 0
    @State var p = 0
    @State var bool2 = 0
    @State var bool = 0
    @State var dotime = 0
    var body: some View {
        VStack {
            Text("")
            
        }
        .onReceive(doTime2) { _ in
            getdata().getdefaultsdataint(type: "")
        }
        .onReceive(doTime) { doTime in
            print(doTime)
            if p < 85 {
                bool = 0
            }
            if bool == 0 {
                if appear == 1 {
                    bool = 1
                }
                if appear == 0{
                    bool = 0
                    dotime += 1
                }
            } else {
                
            }
        }
    }
}
