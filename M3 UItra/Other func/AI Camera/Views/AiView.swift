//
//  AiView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 5/11/2022.
//

import SwiftUI

struct AiView: View {
    @State var action = "loading"
    let timer = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect()
    @Binding var onoff: Bool
    @State var need: Int
    @State var title: String
    @State var warning = false
    var barView: some View {
        VStack {
            Spacer()
            VStack {
                Spacer()
                Rectangle()
                    .foregroundColor(Color(red: 0, green: 60/255, blue: 0))
                    .frame(height: 120)
                    .cornerRadius(30)
                    .padding()
                    .overlay() {
                        Group {
                            if Int(action) ?? 0 <= need {
                                Text("\(title): \(action)")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            } else {
                                Text("Done")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        }
                    }
            }
            
        }
    }
    var body: some View {
        NavigationView {
            ZStack {
                CameraSelfView()
                barView
                dpView()
                if warning {
                    VStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .foregroundColor(.yellow)
                        Text("危險動作")
                            .foregroundStyle(.red)
                    }
                }
                
            }
            
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(StackNavigationViewStyle())
            .toolbar() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        onoff = false
                    }, label: {
                        Text("退出")
                    })
                }
            }
        }
        .onAppear() {
            GetData().savedefaultsdataint(type: "howmanytimes?", data: 0)
        }
        .onReceive(timer) { timer in
            action = "\(GetData().getdefaultsdataint(type: "howmanytimes?"))"
            if "\(GetData().getdefaultsdataint(type: "isUserTried?"))" == "0" {
                warning = false
            } else {
                warning = true
            }
        }
    }
        
}


struct Previews_Counter_Previews: PreviewProvider {
    static var previews: some View {
        preView()
    }
}

struct preView: View {
    @State var onoff = Bool(true)
    @State var need = Int(0)
    @State var title = String("Title(test)(43h79)")
    var body: some View {
        AiView(onoff: $onoff, need: need, title: title).barView
    }
}
