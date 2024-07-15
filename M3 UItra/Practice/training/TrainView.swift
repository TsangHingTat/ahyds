//
//  trainView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 17/8/2022.
//

import SwiftUI

struct TrainView: View {
    @State var view3 = false
    @State var titles = ["仰臥起坐", "掌上壓"]
    @State var aimodel = ["sit-up", "pushup"]
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach((0...1), id: \.self) { i in
                TrainingViewButtonCell(needed: 20, title: titles[i], ai: aimodel[i])
                
            }
        }
        
    }

}

struct TrainView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            TrainView()
        }
    }
}
