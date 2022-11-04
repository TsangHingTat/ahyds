//
//  File.swift
//  AI教你做運動
//
//  Created by M2 Ultra on 4/11/2022.
//

import Foundation
import SwiftUI


struct dpView: View {
    let doTime = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()
    @State var time = 0
    @State var pa = 0
    @State var pb = 0
    @State var bool = 0
    @State var dotime = 0
    var body: some View {
        VStack {
            Text("\(hi(a: 0))")
            Text("\(hi(a: 1))")
            Text(String(dotime))
                
        }
        .onReceive(doTime) { doTime in
            print(doTime)
            if pa > 85 {
                bool = 0
            }
            if pb > 85 {
                bool = 1
            }
            if bool == 0 {
                time += 1
                bool = 1
            }
        }
    }
    func hi(a: Int) -> Double {
        var j = 0
        if a == 0 {
            j = 1
        } else {
            j = 100
        }
        return Double(j)
    }
}
