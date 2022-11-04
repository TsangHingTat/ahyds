//
//  trainView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 17/8/2022.
//

import SwiftUI

struct trainView: View {
    @State var view1 = false
    @State var view2 = false
    @State var view3 = false
    @State var view4 = false
    @State var action = "loading"
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var body: some View {
        ScrollView(showsIndicators: false) {
            // MARK: 可選項目 Button
            Spacer()
                .frame(height: 50)
            Button(action: {
                view3 = true
            }) {
                Rectangle()
                    .frame(width: 340, height: 50)
                    .foregroundColor(.purple)
                    .cornerRadius(15)
                    .padding()
                    .shadow(radius: 10)
                    .overlay() {
                        ZStack {
                            HStack {
                                Text("可選項目")
                                    .foregroundColor(.black)
                                    .font(.title)
                                    .bold()
                            }
                            HStack {
                                Spacer()
                                Image(systemName: "line.3.horizontal")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 25, height: 25)
                                    .padding()
                                Spacer()
                                    .frame(width: 15, height: 50)
                            }
                        }
                    }
            }
            // MARK: 掌上壓 Button
            Button(action: {
                view1 = true
            }) {
                Image("push")
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
                                    Text("掌上壓")
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
            // MARK: 仰臥起坐 Button
            Button(action: {
                view2 = true
            }) {
                Image("pull")
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
                                    Text("仰臥起坐")
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
            #if DEBUG
            // MARK: Debug Button
            Button(action: {
                view4 = true
            }) {
                Image("swift")
                    .resizable()
                    .cornerRadius(15)
                    .frame(width: 340, height: 340)
                    .padding()
                    .shadow(radius: 10)
                    .overlay() {
                        VStack {
                            Spacer()
                            HStack {
                                Text("Debug")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .bold()
                                    .padding(25)
                                Spacer()
                            }
                        }
                    } 
            }
            #endif
            
        }
        // MARK: Action after tapped 掌上壓 Button
        .fullScreenCover(isPresented: $view1) {
            NavigationView {
                VStack {
                    CameraSelfView()
                    Text(action)
                }
                    .navigationTitle("掌上壓")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar() {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                view1 = false
                            }, label: {
                                Text("退出")
                            })
                        }
                    }
            }
        }
        
        // MARK: Action after tapped 仰臥起坐 Button
        .fullScreenCover(isPresented: $view2) {
            NavigationView {
                VStack {
                    CameraSelfView()
                    Text(action)
                }
                    .navigationTitle("仰臥起坐")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar() {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack {
                                Button(action: {
                                    view2 = false
                                }, label: {
                                    Text("退出")
                                })
                            }
                        }
                    }
            }
        }
        // MARK: Action after tapped Debug Button
        .fullScreenCover(isPresented: $view4) {
            NavigationView {
                VStack {
                    CameraSelfView()
                    Text(action)
                }
                    .navigationTitle("Debug")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar() {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack {
                                Button(action: {
                                    view4 = false
                                }, label: {
                                    Text("退出")
                                })
                            }
                        }
                    }
            }
        }
        // MARK: Action after tapped 可選項目 Button
        .sheet(isPresented: $view3) {
             optionalView(isopen: $view3, pushup: $view1, situp: $view2)
        }
        .onReceive(timer) { timer in
            action = getdata().getdefaultsdata(type: "action")
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
