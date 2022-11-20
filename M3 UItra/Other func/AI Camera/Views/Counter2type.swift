//
//  File.swift
//  AI教你做運動
//
//  Created by M2 Ultra on 4/11/2022.
//

import Foundation
import SwiftUI


struct dpView: View {
    let doTime = Timer.publish(every: 0.03, on: .main, in: .common).autoconnect()
    let doTime2 = Timer.publish(every: 0.03, on: .main, in: .common).autoconnect()
    @State var appear = 0
    @State var time = 0
    @State var p = 0
    @State var bool2 = 0
    @State var bool = 0
    @State var dotime = 0
    @State var temp =  ""
    @State var doingst = ""
    
    var body: some View {
        
        VStack {
            Text("")
                .hidden()
        }
        .onAppear() {
            if getdata().getdefaultsdata(type: "mlmodel") == "pushup" {
                dotime = dotime - 1
            } else {
                dotime = dotime - 1
            }
        }
        .onReceive(doTime2) { _ in
            p = getdata().getdefaultsdataint(type: "confidence")
            print("data7495y: \(getdata().getdefaultsdata(type: "mlmodel"))")
            print("data7495y: \(getdata().getdefaultsdataint(type: "confidence"))%")
            print("data7495y: \(getdata().getdefaultsdataint(type: "action"))")
            if getdata().getdefaultsdata(type: "mlmodel") == "sit-up" {
                doingst = "sit-up"
                if getdata().getdefaultsdata(type: "action") == "01" {
                    appear = 1
                } else if getdata().getdefaultsdata(type: "action") == "00" {
                    appear = 0
                }
            } else if getdata().getdefaultsdata(type: "mlmodel") == "pushup" {
                doingst = "pushup"
                if getdata().getdefaultsdata(type: "action") == "11" {
                    appear = 0
                } else if getdata().getdefaultsdata(type: "action") == "10" {
                    appear = 1
                }
            }
            
        }
        .onReceive(doTime) { _ in
            p += 1
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
        .onDisappear() {
            save_data().save(dotime: p, sport_type: "sit-up")
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
            calofpushup = getdata().getdata(date: datedatanow, datanum: 6)
            let calofpushupint = Int(calofpushup) ?? 0
            if calofpushupint >= 100 {
                return true
            } else {
                return false
            }
            
        }
        if type_of_sport == "sit-up" {
            calofsitup = getdata().getdata(date: datedatanow, datanum: 5)
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
    @State var fucku: Float = 0
    @State var calofsitupint: Float = 0
    func save(dotime: Int , sport_type: String) -> Void {
        getdata().notification(title: "func done", subtitle: "yo")
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"
        let datedatanow = "\(formatter1.string(from: today))"
        fucku = Float(Float(dotime)/Float(0.03))
        if sport_type == "sit-up" {
            calofsitup = getdata().getdata(date: datedatanow, datanum: 5)
            calofsitupint = Float (calofsitup) ?? 0
            let age = Float(getdata().getdefaultsdataint(type: "age"))
            let Fuck = Float(getdata().getdefaultsdataint(type: "weight"))
            calofsitupint += Float(Float(Float(age) * Float(0.2017) + Fuck * Float(0.6309) + Float(107) * Float(0.6309) - Float(55.0969)) * (Float(fucku)/Float(60))/Float(4.184))
        }
        if sport_type == "pushup" {
            calofpushup = getdata().getdata(date: datedatanow, datanum: 6)
 //           let calofpushupint = Int(calofpushup) ?? 0
        }
    }
}
//savedata(date: String, datanum: Int, text: String) -> Void
//getdata().savedefaultsdataint(type: "fufuyg", data: Int(0))

