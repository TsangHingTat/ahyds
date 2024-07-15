//
//  RefreshHelper.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 7/11/24.
//

import SwiftUI


struct Refreshhelper: View {
    let defaults = UserDefaults.standard
    @State var alldatakey = ["ismoved"]
    @State var alldatastring = ["ismoved"]
    @Binding var refresh: Bool
    var body: some View {
        Text("Refresh Helper")
            .font(.largeTitle)
            .foregroundColor(.white)
            .bold()
            .hidden()
        
        .onAppear() {
            refresh = false
            if GetData().getdefaultsdata(type: "username") == "" {
                GetData().savedefaultsdata(type: "username", data: "USERNAME")
            }
        }
        
    }

}
