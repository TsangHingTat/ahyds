//
//  HealthView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 19/11/2022.
//

import SwiftUI
import Combine

struct HealthView: View {
    @Binding var refresh: Bool
    @State var cal2 = ""
    @State var high = ""
    @State var age = ""
    @State var weight = ""
    var body: some View {
        List {
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
            GetData().savedefaultsdataint(type: "caldef", data: cal)
            let high2 = Int(high) ?? 165
            GetData().savedefaultsdataint(type: "high", data: high2)
            let age2 = Int(age) ?? 15
            GetData().savedefaultsdataint(type: "age", data: age2)
            let weight2 = Int(weight) ?? 50
            GetData().savedefaultsdataint(type: "weight", data: weight2)
            refresh = true
        }
        .onAppear() {
            cal2 = String(GetData().getdefaultsdataint(type: "caldef"))
            high = String(GetData().getdefaultsdataint(type: "high"))
            age = String(GetData().getdefaultsdataint(type: "age"))
            weight = String(GetData().getdefaultsdataint(type: "weight"))
        }
    }
}


