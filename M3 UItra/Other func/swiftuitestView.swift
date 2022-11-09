////
////  swiftuitestView.swift
////  AI教你做運動
////
////  Created by HingTatTsang on 9/11/2022.
////
//
//import SwiftUI
//
//struct swiftuitestView: View {
//    var view1: some View {
//        VStack {
//            Rectangle()
//                .frame(width: 350,height: 100)
//                .foregroundColor(.red)
//            Rectangle()
//                .frame(width: 350,height: 100)
//                .foregroundColor(.red)
//            
//        }
//    }
//    var view2: some View {
//        HStack {
//            Spacer()
//                .frame(width: 120)
//            Circle()
//                .overlay() {
//                    VStack {
//                        Text(" 卡路里 ")
//                            .padding()
//                            .foregroundColor(.white)
//                            .font(.largeTitle)
//                        Image(systemName: "flame.fill")
//                            .resizable()
//                            .foregroundColor(.white)
//                            .scaledToFit()
//                            .padding()
//                    }
//                    .shadow(radius: 50)
//                }
//        }
//    }
//    var body: some View {
//        ZStack {
//            view1
//                .clipShape(view2)
//            view2
//        }
//    }
//}
//
//struct swiftuitestView_Previews: PreviewProvider {
//    static var previews: some View {
//        swiftuitestView()
//    }
//}
