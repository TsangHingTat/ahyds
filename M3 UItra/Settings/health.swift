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
    @State var cal = 0
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
                            cal = Int(cal2) ?? 2000
                        }
                }
            }
            .navigationTitle("健康")
            
        }
        
        .onDisappear() {
            getdata().savedefaultsdataint(type: "caldef", data: cal)
            refresh = true

        }
        .onAppear() {
            cal2 = String(getdata().getdefaultsdataint(type: "caldef"))
        }
    }
}


