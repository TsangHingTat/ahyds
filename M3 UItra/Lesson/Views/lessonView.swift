//
//  LessonView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 14/11/2022.
//

import SwiftUI

struct LessonView: View {
    @State var showbeta: Bool = false
    var body: some View {
        NavigationView {
            JoinSessionView()
        }.navigationViewStyle(StackNavigationViewStyle())
            .sheet(isPresented: $showbeta) {
                NavigationView {
                    List {
                        Text("Classroom is still under development, therefore some services may not work as expected and data may not be backward compatible.")
                            .font(.title)
                            .foregroundColor(.red)
                    }
                    .toolbar() {
                        Button("Continue") {
                            showbeta.toggle()
                        }
                    }
                    .navigationTitle("Pre-alpha version")
                }
                
            }
        
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView()
    }
}
