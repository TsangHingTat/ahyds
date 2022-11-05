//
//  class.swift
//  M3 UItra
//
//  Created by HingTatTsang on 17/8/2022.
//

import SwiftUI
import WebKit

struct classView: View {
    @State var teacher = 0
    @State var whosheet = false
    var body: some View {
        Spacer()
            .frame(height: 100)
        // MARK: 連接課堂
        Group {
            if teacher == 0 {
                errorView(errorcode: "Cannot detect Techer mode")
            } else if teacher == 1 {
                JoinSessionView(teachermode: true)
            } else {
                JoinSessionView(teachermode: false)
            }
        }
        .onAppear() {
            teacher = getdata().getdefaultsdataint(type: "teacher")
            if teacher == 0 {
                whosheet = true
            }
        }
        .fullScreenCover(isPresented: $whosheet) {
            Button(action: {
                teacher = 1
                getdata().savedefaultsdataint(type: "teacher", data: 1)
                whosheet = false
            }, label: {
                Rectangle()
                    .frame(width: 350,height: 100)
                    .cornerRadius(30)
                    .foregroundColor(.green)
                    .overlay() {
                        Text("我是老師")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .bold()
                    }
            })
            Button(action: {
                teacher = 2
                getdata().savedefaultsdataint(type: "teacher", data: 2)
                whosheet = false
            }, label: {
                Rectangle()
                    .frame(width: 350,height: 100)
                    .cornerRadius(30)
                    .foregroundColor(.green)
                    .overlay() {
                        Text("我是學生")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .bold()
                    }
            })
        }
    }
}


struct classView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
           classView()
        }
    }
}
