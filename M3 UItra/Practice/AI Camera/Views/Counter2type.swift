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
                .hidden()
            
        }
        .onAppear() {
            if getdata().getdefaultsdata(type: "mlmodel") == "pushup" {
                dotime = dotime - 1
            } 
        }
        .onReceive(doTime2) { _ in
            p = getdata().getdefaultsdataint(type: "confidence")
            print("data7495y: \(getdata().getdefaultsdata(type: "mlmodel"))")
            print("data7495y: \(getdata().getdefaultsdataint(type: "confidence"))%")
            print("data7495y: \(getdata().getdefaultsdataint(type: "action"))")
            if getdata().getdefaultsdata(type: "mlmodel") == "sit-up" {
                if getdata().getdefaultsdata(type: "action") == "01" {
                    appear = 1
                } else if getdata().getdefaultsdata(type: "action") == "00" {
                    appear = 0
                }
            } else if getdata().getdefaultsdata(type: "mlmodel") == "pushup" {
                if getdata().getdefaultsdata(type: "action") == "11" {
                    appear = 0
                } else if getdata().getdefaultsdata(type: "action") == "10" {
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
                dotime += 1
                
            }
            getdata().savedefaultsdataint(type: "howmanytimes?", data: dotime)
            print(getdata().getdefaultsdata(type: "action"))
        }
    }
}

