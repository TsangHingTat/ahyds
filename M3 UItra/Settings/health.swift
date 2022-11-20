//
//  健康.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 19/11/2022.
//

import SwiftUI
import Combine

struct healthView: View {
    @Binding var refresh: Bool
    @State var cal2 = ""
    @State var high = ""
    @State var age = ""
    @State var weight = ""
    var body: some View {
        List {
            Section {
                HStack {
                    Text("卡路里目標")
                    TextEditor(text: $cal2)
                        .keyboardType(.numberPad)
                        .onReceive(Just(cal2)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.cal2 = filtered
                            }
                        }
                }
            }
            Section {
                HStack {
                    Text("身高")
                    TextEditor(text: $high)
                        .keyboardType(.numberPad)
                        .onReceive(Just(high)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.high = filtered
                            }
                        }
                }
            }
            Section {
                HStack {
                    Text("年齡")
                    TextEditor(text: $age)
                        .keyboardType(.numberPad)
                        .onReceive(Just(age)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.age = filtered
                            }
                        }
                }
            }
            Section {
                HStack {
                    Text("體重")
                    TextEditor(text: $weight)
                        .keyboardType(.numberPad)
                        .onReceive(Just(weight)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.weight = filtered
                            }
                        }
                }
            }
            .navigationTitle("健康")
            
        }
        
        .onDisappear() {
            let cal = Int(cal2) ?? 2000
            getdata().savedefaultsdataint(type: "caldef", data: cal)
            let high2 = Int(high) ?? 165
            getdata().savedefaultsdataint(type: "high", data: high2)
            let age2 = Int(age) ?? 15
            getdata().savedefaultsdataint(type: "age", data: age2)
            let weight2 = Int(weight) ?? 50
            getdata().savedefaultsdataint(type: "weight", data: weight2)
            refresh = true
        }
        .onAppear() {
            cal2 = String(getdata().getdefaultsdataint(type: "caldef"))
            high = String(getdata().getdefaultsdataint(type: "high"))
            age = String(getdata().getdefaultsdataint(type: "age"))
            weight = String(getdata().getdefaultsdataint(type: "weight"))
        }
    }
}


