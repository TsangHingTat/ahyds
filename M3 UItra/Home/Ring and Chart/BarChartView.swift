//
//  BarChartView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 22/8/2022.
//

import SwiftUI

struct BarChartView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var data: Float
    @State var per: Float
    @State var size = Float(1.6)
    @State var small = Float(10)
    @State var text = false
    var body: some View {
        HStack {
            VStack {
                VStack {
                    if data > 2000 {
                        VStack {
                            Rectangle()
                                .foregroundColor(.green)
                                .frame(width: 20*CGFloat(size))
                        }
                        
                    } else {
                        ZStack {
                            VStack {
                                if data != 0 {
                                    Rectangle()
                                        .foregroundColor(.yellow)
                                        .frame(width: 20*CGFloat(size), height: CGFloat(per)/CGFloat(small))
                                } else {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .opacity(0)
                                        .frame(width: 20*CGFloat(size), height: CGFloat(CGFloat(200)-CGFloat(data)/CGFloat(small)))
                                }
                            }
                            ZStack {
                                if data != 0 {
                                    VStack {
                                        if colorScheme == .light {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .opacity(1)
                                                .frame(width: 20*CGFloat(size), height: CGFloat(CGFloat(200)-CGFloat(data)/CGFloat(small)))
                                        } else {
                                            Rectangle()
                                                .foregroundColor(.black)
                                                .opacity(1)
                                                .frame(width: 20*CGFloat(size), height: CGFloat(CGFloat(200)-CGFloat(data)/CGFloat(small)))
                                        }
                                        Spacer()
                                    }
                                }
                                if text {
                                    VStack {
                                        Spacer()
                                        Text("今")
                                            .foregroundColor(.green)
                                            .padding(.top)
                                        Text("天")
                                            .foregroundColor(.green)
                                            .padding(.bottom)
                                    }
                                }
                                
                            }
                        }
                        
                    }
                    
                    
                }
                .frame(height: CGFloat(per)/CGFloat(small))
                ZStack {
                    HStack {
                        Text("\(Int(data))")
                    }
                    Text("0000")
                        .opacity(0)
                }
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            BarChartView(data: 200, per: 2000, text: true)
            BarChartView(data: 500, per: 2000, text: true)
            BarChartView(data: 900, per: 2000, text: true)
            BarChartView(data: 1200, per: 2000, text: true)
            BarChartView(data: 1600, per: 2000, text: true)
            BarChartView(data: 9000, per: 2000, text: true)
        }
    }
}
