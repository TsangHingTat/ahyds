//
//  File.swift
//  AI教你做運動
//
//  Created by M2 Ultra on 4/11/2022.
//

import Foundation
import SwiftUI
import Combine

struct dpView: View {
    let doTime = Timer.publish(every: 0.03, on: .main, in: .default).autoconnect()
    let doTime2 = Timer.publish(every: 0.03, on: .main, in: .default).autoconnect()
    @State var appear = 0
    @State var time = 0
    @State var p = 0
    @State var bool2 = 0
    @State var bool = 0
    @State var dotime = 0
    @State var temp =  ""
    @State var doingst = ""
    @State var goodmoring: Float = 0
    var body: some View {
        
        VStack {
            Text("")
                .hidden()
        }
        .onAppear() {
            if GetData().getdefaultsdata(type: "mlmodel") == "pushup" {
                dotime = dotime - 1
            } else {
                dotime = dotime - 1
            }
            
        }
        .onReceive(doTime2) { _ in
            p = GetData().getdefaultsdataint(type: "confidence")
            print("data7495y: \(GetData().getdefaultsdata(type: "mlmodel"))")
            print("data7495y: \(GetData().getdefaultsdataint(type: "confidence"))%")
            print("data7495y: \(GetData().getdefaultsdataint(type: "action"))")
            if GetData().getdefaultsdata(type: "mlmodel") == "sit-up" {
                doingst = "sit-up"
                if GetData().getdefaultsdata(type: "action") == "01" {
                    appear = 1
                } else if GetData().getdefaultsdata(type: "action") == "00" {
                    appear = 0
                }
            } else if GetData().getdefaultsdata(type: "mlmodel") == "pushup" {
                doingst = "pushup"
                if GetData().getdefaultsdata(type: "action") == "11" {
                    appear = 0
                } else if GetData().getdefaultsdata(type: "action") == "10" {
                    appear = 1
                }
            }
            
        }
        .onReceive(doTime) { _ in
            goodmoring += 1
            if appear == 1 {
                
                bool = 0
                
            }
            
            if bool == 0 && appear == 0 {
                
                bool = 1
                dotime += 1
                
            }
            GetData().savedefaultsdataint(type: "howmanytimes?", data: dotime)
            print(GetData().getdefaultsdata(type: "action"))
        }
        .onDisappear() {
            goodmoring = goodmoring * Float(0.03)
            save_data().save(dotime: goodmoring, sport_type: "sit-up" , doinftime: Float(dotime))
        }
    }
}

struct done_and_non_done {
    @State var calofpushup = ""
    @State var calofsitup = ""
    func done_and_non_done(type_of_sport: String) -> Bool {
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"
        let datedatanow = "\(formatter1.string(from: today))"
//      pushup
//      sit-up
//      type_of_sport
        if type_of_sport == "pushup" {
            calofpushup = GetData().getdata(date: datedatanow, datanum: 6)
            let calofpushupint = Int(calofpushup) ?? 0
            if calofpushupint >= 100 {
                return true
            } else {
                return false
            }
            
        }
        if type_of_sport == "sit-up" {
            calofsitup = GetData().getdata(date: datedatanow, datanum: 5)
            let calofsitupint = Int(calofsitup) ?? 0
            if calofsitupint >= 100 {
                return true
                
            } else {
                return false
            }
         }
//   print(datedatanow) -> "2022-01-01"
          return false
    }
 }


struct save_data {
    
    
    
    @State var calofpushup = ""
    @State var calofsitup = ""
    @State var calofsitupFloat: Float = 0
    func save(dotime: Float , sport_type: String , doinftime: Float) -> Void {
        //GetData().notification(title: "func done", subtitle: "yo")
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"
        let datedatanow = "\(formatter1.string(from: today))"
        if sport_type == "sit-up" {
            GetData().savedata(date: datedatanow, datanum: 5, text: "\(Float(GetData().getdata(date: datedatanow, datanum: 5)) ?? 0 + (doinftime * 1.1))")
            GetData().savedata(date: datedatanow, datanum: 5, text: "\(Float(GetData().getdata(date: datedatanow, datanum: 1)) ?? 0  + doinftime)")
            GetData().notification(title: "done", subtitle: "\(NSLocalizedString("時間", comment: "時間")) = \(dotime) , \(NSLocalizedString("次數", comment: "次數")) = \(doinftime) , \(NSLocalizedString("卡路里", comment: "卡路里")) = \(dotime * 2)")
        }
        if sport_type == "pushup" {
            GetData().savedata(date: datedatanow, datanum: 6, text: "\(Float(GetData().getdata(date: datedatanow, datanum: 5)) ?? 0 + (doinftime * 1.1))")
            GetData().savedata(date: datedatanow, datanum: 2, text: "pushup - \(Float(GetData().getdata(date: datedatanow, datanum: 1)) ?? 0 + doinftime)")
        }
    }
}
//savedata(date: String, datanum: Int, text: String) -> Void
//GetData().savedefaultsdataint(type: "fufuyg", data: Int(0))
//goo morning
//good morningr
// good morning
// good morning
