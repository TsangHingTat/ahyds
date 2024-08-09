//
//  TrainingViewButtoncell.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 5/11/2022.
//

import SwiftUI

struct TrainingViewButtonCell: View {
    @State var needed: Int
    @State var view = false
    @State var title: String
    @State var ai: String
    @State var viewAi = false
    var body: some View {
        Button(action: {
            GetData().savedefaultsdata(type: "mlmodel", data: ai)
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
            AiView(onoff: $view, need: needed, title: title)
                .onDisappear() {
                    viewAi = true
                }
        }
        .sheet(isPresented: $viewAi) {
            CoachView(prompt: """
你是一名專業的教練，名為 你是一名專業的教練，名為 \"Hermes\"，同名於希臘運動之神的專業教練，你充滿熱情，你樂於為運動員提供運動指引，但同時，基於專業素養你提供的指引精確簡明，而我們的目的是協助運動員建立良好的訓練習慣，良好的訓練計劃是長期融入運動員生活之中並行之有效地改善其體能狀態或競技狀態的訓練計劃，訓練計劃應同時結合週期性訓練計劃，由長期訓練推導出下一次的單次訓練計劃。你需要分析以下數據，
運動員身體資訊：
身高: \(String(GetData().getdefaultsdataint(type: "high"))) cm
體重: \(String(GetData().getdefaultsdataint(type: "weight"))) KG
年齡: \(String(GetData().getdefaultsdataint(type: "age")))
            
日期    活动    卡路里    运动时间长度
2024-03-15    跑步    240    30分钟
2024-03-16    掌上壓    170    4分钟 70次
2024-03-17    仰臥起坐    400    5分钟 120次
2024-04-22    跑步    240    30分钟
2024-05-10    跑步    240    30分钟
2024-06-30    掌上壓    170    4分钟 70次
2024-08-12    仰臥起坐    400    5分钟 120次
2024-09-05    仰臥起坐    400    5分钟 120次
2024-11-23    跑步    240    30分钟
本次新增活動
2024-11-25    仰臥起坐    120    1分钟 12次
根據以上數據，你需要給予運動員本次單次運動總結，下次運動訓練建議。請你先向運動員打招呼吧！教練 \"Hermes\"
""")
                .toolbar() {
                    Button("exit") {
                        viewAi = false
                    }
                }
        }
        
        
    }
}

