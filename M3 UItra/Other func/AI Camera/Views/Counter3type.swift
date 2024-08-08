//
//  File.swift
//  AI教你做運動
//
//  Created by M2 Ultra on 4/11/2022.
//

import Foundation
import SwiftUI
import Combine

struct dp3View: View {
    let doTime = Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()
    let doTime2 = Timer.publish(every: 0.01, on: .main, in: .default).autoconnect()
    @State var appear = 0
    @State var time = 0
    @State var p = 0
    @State var bool2 = 0
    @State var bool = 0
    @State var dotime = 0
    @State var isUserTried = 0
    
    var body: some View {
        
        VStack {
            Text("")
                .hidden()
            
        }
        .onReceive(doTime2) { _ in
            p = GetData().getdefaultsdataint(type: "confidence")
            print("data7495y: \(GetData().getdefaultsdata(type: "mlmodel"))")
            print("data7495y: \(GetData().getdefaultsdataint(type: "confidence"))%")
            print("data7495y: \(GetData().getdefaultsdataint(type: "action"))")
            if GetData().getdefaultsdata(type: "mlmodel") == "sit-up" {
                if GetData().getdefaultsdata(type: "action") == "01" {
                    appear = 1
                } else if GetData().getdefaultsdata(type: "action") == "00" {
                    appear = 0
                }
            } else if GetData().getdefaultsdata(type: "mlmodel") == "pushup" {
                if GetData().getdefaultsdata(type: "action") == "11" {
                    appear = 0
                } else if GetData().getdefaultsdata(type: "action") == "10" {
                    appear = 1
                }
            }
                
            
        }
        .onReceive(doTime) { _ in
            if appear == 1 {
                
                bool = 0
                
            }
            
            if bool == 0 && appear == 0 {
                
                bool = 1
                bool2 = 1
                dotime += 1
                
            }
            if dotime >= 60 {
                isUserTried = 1
            }
            GetData().savedefaultsdataint(type: "isUserTried?", data: isUserTried)
            GetData().savedefaultsdataint(type: "howmanytimes?", data: dotime-1)
            print(GetData().getdefaultsdata(type: "action"))
        }
    }
}

