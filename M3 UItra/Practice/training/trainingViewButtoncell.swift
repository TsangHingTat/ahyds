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
    @State var ai: String
    var body: some View {
        Button(action: {
            getdata().savedefaultsdata(type: "mlmodel", data: ai)
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
            aiView(onoff: $view, need: needed, title: title)
            
        }
        
    }
}

