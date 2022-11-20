//
//  homeView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI
import Combine

struct homeView: View {
    let defaults = UserDefaults.standard
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State var showwelcome = false
    @State var username = ""
    @State var navtitle = NSLocalizedString("成就", comment: "成就")
    @State var health = Float(0)
    @State var caltoday = Float(0)
    @State var reward = 0
    @State var message = 0
    @State var cal1 = ""
    @State var cal2 = ""
    @State var cal3 = ""
    @State var cal4 = ""
    @State var showdate = false
    @State var water = Double(0)
    
    @State var open = false
    @State var popupViewShow = false
    
    @State var supportedsport = ["仰臥起坐", "掌上壓"]
    @State var supportedsportdone = [true, false]
    
    @State var supportedsportname = ["sit-up", "pushup"]
    
    @State var viewnew = ["Copper", "Silver", "Gold", "Aluminium"]
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                 VStack {
                     VStack {
                         if reward != 0 {
                             ScrollView(.horizontal, showsIndicators: false) {
                                 HStack(alignment: .top, spacing: 0) {
                                     ForEach((0...reward), id: \.self) { i in
                                         ViewView(name: viewnew[i], title: viewnew[i])
                                     }
                                 }
                                 
                             }
                             .padding(.horizontal)
                         } else {
                             Text("獎勵將顯示在這裡...")
                                 .font(.system(size: 30))
                                 .frame(height: 120)
                                 .padding(.horizontal)
                         }
                         
                     }
                    HStack {
                        VStack {
                            HStack {
                                VStack {
                                    ForEach((0...1), id: \.self) { i in
                                        HStack {
                                            Button(action: {
                                                open.toggle()
                                            }, label: {
                                                Rectangle()
                                                    .foregroundColor(.black)
                                                    .frame(height: 50)
                                                    .opacity(0.2)
                                                    .cornerRadius(15)
                                                    .overlay() {
                                                        HStack {
                                                            //      pushup
                                                            //      sit-up
                                                            if done_and_non_done().done_and_non_done(type_of_sport: "\(supportedsportname[i])") {
                                                                Text("✅")
                                                                    .font(.title)
                                                                    .padding()
                                                                    .foregroundColor(.white)
                                                            } else {
                                                                Text("🔴")
                                                                    .font(.title)
                                                                    .padding()
                                                                    .foregroundColor(.white)
                                                            }
                                                            Text(NSLocalizedString("\(supportedsport[i])", comment: "\(supportedsport[i])"))
                                                                .font(.title)
                                                                .foregroundColor(.white)
                                                            Spacer()
                                                        }
                                                    }
                                            })
                                        }
                                        .fullScreenCover(isPresented: $open) {
                                            aiView(onoff: $open, need: 30, title: "\(NSLocalizedString("\(supportedsport[i])", comment: "\(supportedsport[i])"))")
                                        }
                                    }
                                }
                                Spacer()
                                Button(action: {
                                    popupViewShow.toggle()
                                }, label: {
                                    Group {
                                        ZStack {
                                            Rectangle()
                                                .cornerRadius(25)
                                                .foregroundColor(.white)
                                                .frame(width: 140, height: 140)
                                                .padding()
                                            Rectangle()
                                                .cornerRadius(25)
                                                .foregroundColor(.white)
                                                .opacity(0.7)
                                                .frame(width: 140, height: 140)
                                                .padding()
                                                .overlay() {
                                                    ZStack {
                                                        waterView(percent: $water)
                                                            .mask(Rectangle().cornerRadius(25).foregroundColor(.white).opacity(0.7).frame(height: 140).padding())
                                                        if caltoday >= Float(getdata().getdefaultsdataint(type: "caldef")) {
                                                            Rectangle().cornerRadius(25).foregroundColor(.green).frame(height: 140).padding()
                                                        }
                                                        // MARK: 任務 Pie Chart
                                                        HStack {
                                                            // MARK: 卡路里
                                                            VStack {
                                                                Image("cal")
                                                                    .resizable()
                                                                    .scaledToFit()
                                                                    .overlay() {
                                                                        ZStack {
                                                                            VStack {
                                                                                Text("今天")
                                                                                    .foregroundColor(.black)
                                                                                    .font(.title3)
                                                                                Text("\(Int(loadcaldata()))/2,000")
                                                                                    .foregroundColor(.black)
                                                                                    .font(.title3)
                                                                                Text("卡路里")
                                                                                    .foregroundColor(.black)
                                                                                    .font(.title3)
                                                                            }
                                                                            
                                                                        }
                                                                    }
                                                            }
                                                            
                                                        }
                                                    }
                                                }
                                                .onAppear() {
                                                    water = Double((Int(caltoday)/2000)*100)
                                                    let newwater = Double(water)
                                                    printnow(message: "\(newwater)")
                                                }
                                        }
                                        .environment(\.colorScheme, .light)
                                        .shadow(radius: 5)
                                    }
                                })
                            }
                            todayView(year: "", month: "", istoday: true, home: true)
                                .shadow(radius: 5)
                        }
                    }
                    .frame(maxWidth: 500)
                }

            }
            .sheet(isPresented: $popupViewShow) {
                NavigationView {
                    GeometryReader { proxy in
                        TabView {
                            LazyVStack {
                                VStack {
                                    VStack {
                                        ZStack {
                                            HStack {
                                                // MARK: 卡路里
                                                VStack {
                                                    let callllll = Float(loadcaldata())
                                                    let temp: CGFloat = CGFloat(callllll/Float(getdata().getdefaultsdataint(type: "caldef")))
                                                    RingView(percentage: temp, backgroundColor: .white, startColor: .red, endColor: .green, thickness: 35)
                                                }
                                                .overlay() {
                                                    ZStack {
                                                        VStack {
                                                            Text("今天")
                                                                .foregroundColor(.black)
                                                                .font(.title)
                                                            Text("\(Int(loadcaldata()))/2,000")
                                                                .foregroundColor(.black)
                                                                .font(.title)
                                                            Text("卡路里")
                                                                .foregroundColor(.black)
                                                                .font(.title)
                                                        }
                                                        
                                                    }
                                                    .padding()
                                                }
                                                
                                            }
                                        }
                                        calchartView()
                                    }
                                }
                                .frame(width: proxy.size.width, height: proxy.size.height)
                                .rotationEffect(.degrees(-90))
                            }
                            
                            
                        }
                        .frame(width: proxy.size.height, height: proxy.size.width)
                        .rotationEffect(.degrees(90), anchor: .topLeading)
                        .offset(x: proxy.size.width)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    }
                    .navigationBarTitle("紀錄")
                }
            }
            .background() {
                Image("background1")
                    .resizable()
                    .padding()
                    .fixedSize(horizontal: true, vertical: true)
                    .opacity(0.5)
            }
            
            // MARK: 標題
            .navigationTitle(navtitle)
            
        }
        
        
        .environment(\.colorScheme, .dark)
        
        // MARK: 載入數據
        .onAppear() {
            runwelcome()
            health = loadcaldata()/Float(getdata().getdefaultsdataint(type: "caldef"))
            caltoday = loadcaldata()
            reward = getdata().getdefaultsdataint(type: "reward")
            showdateload()
            
        }
        // MARK: 自動更變標題文字
        .onReceive(timer) { input in
            if showwelcome == true {
                if message != 3 {
                    message = message+1
                } else {
                    message = 1
                }
                if message == 1 {
                    runwelcome()
                    printnow(message: "歡迎, \(username)")
                } else if message == 2{
                    navtitle = "\(NSLocalizedString("已完成", comment: "已完成"))\(Int(health*100))\(NSLocalizedString("%任務", comment: "%任務"))"
                    printnow(message: "已完成\(Int(health*100))%任務")
                } else if message == 3 {
                    navtitle = "\(NSLocalizedString("已消耗", comment: "已消耗")) \(Int(caltoday)) \(NSLocalizedString("卡路里", comment: "卡路里"))"
                    printnow(message: "已消耗 \(Int(caltoday)) 卡路里")
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
//        .frame(maxWidth: 700)
    }
    // MARK: 刷新數據
    func loadcaldata() -> Float {
        printnow(message: "loadcaldata()")
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"
        let datedatanow = "\(formatter1.string(from: today))"
        let sum1 = stringtofloat(string: getdata().getdata(date: datedatanow, datanum: 5))
        let sum2 = stringtofloat(string: getdata().getdata(date: datedatanow, datanum: 6))
        let sum3 = stringtofloat(string: getdata().getdata(date: datedatanow, datanum: 7))
        let sum4 = stringtofloat(string: getdata().getdata(date: datedatanow, datanum: 8))
        let datacal = String(sum1+sum2+sum3+sum4)
        let loaddata = datacal
        return Float(loaddata) ?? 0
    }
    func showdateload() -> Void {
        printnow(message: "loadcaldata()")
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        let datamem = defaults.string(forKey: "\(datedatanow)dataitem1")
        if datamem == nil {
            showdate = false
        } else {
            showdate = true
        }
        
    }
    
    // MARK: 檢查是否有在設定中打開"歡迎訊息"
    func runwelcome() -> Void {
        printnow(message: "runwelcome()")
        username = defaults.string(forKey: "username") ?? "USERNAME"
        showwelcome = defaults.bool(forKey: "showwelcome")
        if showwelcome == true {
            navtitle = "\(NSLocalizedString("歡迎", comment: "歡迎")), \(username)"
        }
    }
    func stringtofloat(string: String) -> Float {
        let numberFormatter = NumberFormatter()
        let number = numberFormatter.number(from: string)
        let numberFloatValue = number?.floatValue ?? 0
        return numberFloatValue
    }

    func printnow(message: String) {
        let today = Date()
        let hours   = (Calendar.current.component(.hour, from: today))
        let minutes = (Calendar.current.component(.minute, from: today))
        let seconds = (Calendar.current.component(.second, from: today))
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        NSLog("homeView: \(datedatanow) \(hours):\(minutes):\(seconds) - \(message)")
        
    }
    func getdatecalc(day: Int) -> String {
        guard let tday = Calendar.current.date(byAdding: .day, value: day, to: Date.now) else { return "E" }
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"
        let datedatanow = "\(formatter1.string(from: tday))"
        return datedatanow
    }

    
}



struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}

