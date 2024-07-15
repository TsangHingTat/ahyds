//
//  ErrorView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct ErrorView: View {
    var errorcode = ""
    var body: some View {
        VStack {
            Text("發生錯誤")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
                .padding()
            if errorcode == "" {
                Text("頁面開發中")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
            } else {
                Text("\(errorcode)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}



struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorcode: "(Preview)")
    }
}
