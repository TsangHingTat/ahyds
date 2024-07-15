//
//  supportView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 31/8/2022.
//

import SwiftUI
import Foundation

struct SupportView: View {
    var body: some View {
        Jsondata()
    }
}


struct supportView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView()
    }
}


public class SupportFetcher: ObservableObject {

    @Published var supports = [Support]()
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "http://58.177.101.104:9000/TsangHingTat/ahyds/raw/branch/main/M3%20UItra/support.json")!
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([Support].self, from: d)
                    DispatchQueue.main.async {
                        self.supports = decodedLists
                    }
                }else {
                    //no data
                }
            } catch {
                //error
            }
            
        }.resume()
       
    }
}

struct Jsondata: View {
    @ObservedObject var fetcher = SupportFetcher()
    var body: some View {
        List {
            Section {
                ForEach(fetcher.supports) { support in
                    NavigationLink(destination: WebView(url: URL(string:"\(support.stringurl)")!).navigationTitle(support.name).navigationBarTitleDisplayMode(.inline)) {
                        Text(support.name)
                    }
                }
            }
        }
    }
}


struct Support: Codable, Identifiable {
    public var id: Int
    public var name: String
    public var stringurl: String
    
    enum CodingKeys: String, CodingKey {
           case id = "id"
           case name = "name"
           case stringurl = "stringurl"
        }
}

