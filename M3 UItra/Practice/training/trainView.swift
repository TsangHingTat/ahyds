//
//  trainView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 17/8/2022.
//

import SwiftUI

struct trainView: View {
    @State var view3 = false
    @State var titles = ["仰臥起坐", "掌上壓"]
    @State var aimodel = ["push-up", "pushup"]
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach((titles), id: \.self) { title in
                trainingViewButtoncell(needed: 20, title: titles, ai: aimodel)
                
            }
        }
        
    }

}

struct trainView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            trainView()
        }
    }
}
