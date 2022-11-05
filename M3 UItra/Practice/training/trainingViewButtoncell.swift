//
//  trainingViewButtoncell.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 5/11/2022.
//

import SwiftUI

struct trainingViewButtoncell: View {
    @State var needed: Int
    @State var view = false
    @State var title: String
    var body: some View {
        Button(action: {
            view = true
        }) {
            Image(title)
                .resizable()
                .frame(width: 340, height: 240)
                .cornerRadius(15)
                .padding()
                .shadow(radius: 10)
                .overlay() {
                    ZStack {
                        VStack {
                            Spacer()
                            HStack {
                                Text("\(NSLocalizedString("\(title)", comment: "\(title)"))")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .bold()
                                    .padding(25)
                                Spacer()
                            }
                        }
                        
                    }
                }
        }
        .fullScreenCover(isPresented: $view) {
            if title == "仰臥起坐" {
                aiView(onoff: $view, need: needed, title: title)
            } else {
                VStack {
                    Spacer()
                        .frame(height: 190)
                    errorView(errorcode: "AI Model is missing.")
                        .padding()
                    Button("Back") {
                        view.toggle()
                    }
                    Spacer()
                }
            }
        }
        
    }
}

