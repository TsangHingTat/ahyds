//
//  welcomeView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 18/8/2022.
//

import SwiftUI

// MARK: 歡迎頁面

struct welcomeView: View {
    @Binding var showWelcomeScreen: Bool
    @State var isOnline = false
    @State var reno = false
    @State var username = "USERNAME"
    var firstview: some View {
        VStack {
            Spacer()
            Text("歡迎使用")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("AI教你做運動")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Spacer()
            HStack {
                NavigationLink(destination: secview) {
                    HStack {
                        Spacer()
                        Text("繼續")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(15)
                }
                
            }
            .padding()
                        
        }
    }
    var secview: some View {
        usernameView(username: $username, refresh: $reno)
            .navigationTitle("設定你的名稱")
            .toolbar() {
                NavigationLink(destination: thrview) {
                    Text("繼續")
                }
            }
    }
    var thrview: some View {
        healthView(refresh: $reno)
            .navigationTitle("健康數據")
            .toolbar() {
                NavigationLink(destination: fouview) {
                    Text("繼續")
                }
            }
    }
    var fouview: some View {
        VStack {
            Spacer()
            Text("開始使用")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Spacer()
            VStack {
                FeatureCell(image: "info.circle.fill", title: "Version", subtitle: UIApplication.appVersion ?? "", color: .gray)
                    .padding()
            }
                .frame(height: 70)
                .background(.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding()
            VStack {
                FeatureCell(image: "exclamationmark.triangle.fill", title: "develop in progress", subtitle: "This app is develop in progress.", color: .yellow)
                    .padding()
            }
                .frame(height: 70)
                .background(.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding()
            Spacer()
            HStack {
                Button(action: {
                    getdata().savedefaultsdata(type: "firstopen1.1", data: UIApplication.appVersion ?? "")
                    self.showWelcomeScreen = false
                }) {
                    HStack {
                        Spacer()
                        Text("開始")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                .frame(height: 50)
                .background(Color.blue)
                .cornerRadius(15)
            }
            .padding()
        }
    }
    var body: some View {
        if getdata().getdefaultsdata(type: "firstopen1.1") == "" {
            NavigationView {
                firstview
            }
        } else {
            NavigationView {
                VStack {
                    Spacer()
                    Text("更新已完成")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("AI教你做運動")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Spacer()
                    HStack {
                        Button(action: {
                            getdata().savedefaultsdata(type: "firstopen1.1", data: UIApplication.appVersion ?? "")
                            self.showWelcomeScreen = false
                        }) {
                            HStack {
                                Spacer()
                                Text("繼續")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        }
                        .frame(height: 50)
                        .background(Color.blue)
                        .cornerRadius(15)
                    }
                    .padding()
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        
        
    }
    
}

//NavigationView {
//    ScrollView {
//        Spacer()
//            .frame(height: 30)
//        if getdata().getdefaultsdata(type: "firstopen1.1") == "" {
//            Text("歡迎使用")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .multilineTextAlignment(.center)
//            Text("AI教你做運動")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .multilineTextAlignment(.center)
//
//            Spacer()
//                .frame(height: 80)
//            NavigationLink(destination: usernameView(username: $username, refresh: $reno).navigationTitle("設定你的名稱")) {
//                HStack {
//                    HStack {
//                        Image(systemName: "person.circle")
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                            .foregroundColor(.black)
//                        VStack {
//                            HStack {
//                                Text(username)
//                                    .font(.title3)
//                                    .foregroundColor(.black)
//                                Spacer()
//                            }
//                            HStack {
//                                Text("設定你的名稱")
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                                Spacer()
//                            }
//                        }
//                        Spacer()
//                        Image(systemName: "arrow.right")
//                            .foregroundColor(.gray)
//                            .padding(.horizontal)
//                    }
//                    .padding()
//                }
//                .frame(height: 70)
//                .background(.white)
//                .cornerRadius(15)
//                .shadow(radius: 5)
//                .padding()
//            }
//            NavigationLink(destination: healthView(refresh: $reno).navigationTitle("健康數據")) {
//                HStack {
//                    HStack {
//                        Image(systemName: "heart.circle")
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                            .foregroundColor(.black)
//                        VStack {
//                            HStack {
//                                Text("健康數據")
//                                    .font(.title3)
//                                    .foregroundColor(.black)
//                                Spacer()
//                            }
//                            HStack {
//                                Text("設定你的健康數據")
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                                Spacer()
//                            }
//                        }
//                        Spacer()
//                        Image(systemName: "arrow.right")
//                            .foregroundColor(.gray)
//                            .padding(.horizontal)
//                    }
//                    .padding()
//                }
//                .frame(height: 70)
//                .background(.white)
//                .cornerRadius(15)
//                .shadow(radius: 5)
//                .padding()
//            }
//        } else {
//            Text("更新已完成")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .multilineTextAlignment(.center)
//            Text("AI教你做運動")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .multilineTextAlignment(.center)
//        }
//        VStack {
//            FeatureCell(image: "info.circle.fill", title: "Version", subtitle: UIApplication.appVersion ?? "", color: .gray)
//                .padding()
//        }
//            .frame(height: 70)
//            .background(.white)
//            .cornerRadius(15)
//            .shadow(radius: 5)
//            .padding()
//        VStack {
//            FeatureCell(image: "exclamationmark.triangle.fill", title: "develop in progress", subtitle: "This app is develop in progress.", color: .yellow)
//                .padding()
//        }
//            .frame(height: 70)
//            .background(.white)
//            .cornerRadius(15)
//            .shadow(radius: 5)
//            .padding()
//        Spacer()
//            .frame(height: 50)
//        HStack {
//            Button(action: {
//                getdata().savedefaultsdata(type: "firstopen1.1", data: UIApplication.appVersion ?? "")
//                self.showWelcomeScreen = false
//            }) {
//                HStack {
//                    Spacer()
//                    Text("繼續")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                    Spacer()
//                }
//            }
//            .frame(height: 50)
//            .background(Color.blue)
//            .cornerRadius(15)
//        }
//        .padding()
//    }
//}

struct FeatureCell: View {
    var image: String
    var title: String
    var subtitle: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 24) {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32)
                .foregroundColor(color)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Text(subtitle)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}




