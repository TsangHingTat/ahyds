//
//  lessonView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 14/11/2022.
//

import SwiftUI

struct lessonView: View {
    @State var showbeta: Bool = true
    var body: some View {
        NavigationView {
            List {
                Text("Classroom is still under development, therefore some services may not work as expected and data may not be backward compatible.")
                    .font(.title2)
                    .foregroundColor(.red)
                NavigationLink(destination: JoinSessionView().navigationBarBackButtonHidden(true)) {
                    Text("Continue")
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Pre-alpha version")
        }
        
    }
}

struct lessonView_Previews: PreviewProvider {
    static var previews: some View {
        lessonView()
    }
}
