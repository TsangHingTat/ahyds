//
//  TransappListView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 30/8/2022.
//

import SwiftUI

struct RemoteListView: View {
  @EnvironmentObject var remoteConnectionManager: RemoteConnectionManager

  var body: some View {
    ZStack {
        VStack {
            Text("正在等待連線")
                .font(.largeTitle)
            Button("返回") {
                remoteConnectionManager.leaveRemote()
            }
            .padding()
            ProgressView()
        }
        ZStack {
            Group {
                ScrollViewReader { reader in
                  VStack(alignment: .leading, spacing: 20) {
                    ForEach(remoteConnectionManager.messages) { message in
                        if remoteConnectionManager.isHosting == false {
                            MessageBodyView(message: message)
                              .onAppear {
                                if message == remoteConnectionManager.messages.last {
                                  reader.scrollTo(message.id)
                                }
                                  remoteConnectionManager.leaveRemote()
                              }
                        } else {
                            MessageBodyView2(message: message)
                              .onAppear {
                                if message == remoteConnectionManager.messages.last {
                                  reader.scrollTo(message.id)
                                }
                                  
                              }
                        }
                    }
                  }
                  .padding(16)
                }
            }
            
        }
    }
  }
    
}

class getLocalNetworkAccessState : NSObject {
    var service: NetService
    var denied: DispatchWorkItem?
    var completion: ((Bool) -> Void)
    
    @discardableResult
    init(completion: @escaping (Bool) -> Void) {
        self.completion = completion
        
        service = NetService(domain: "local.", type:"_lnp._tcp.", name: "LocalNetworkPrivacy", port: 1100)
        
        super.init()
        
        denied = DispatchWorkItem {
            self.completion(false)
            self.service.stop()
            self.denied = nil
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: denied!)
        
        service.delegate = self
        self.service.publish()
    }
}

extension getLocalNetworkAccessState : NetServiceDelegate {
    
    func netServiceDidPublish(_ sender: NetService) {
        denied?.cancel()
        denied = nil

        completion(true)
    }
    
    func netService(_ sender: NetService, didNotPublish errorDict: [String : NSNumber]) {
        NSLog("Error: \(errorDict)")
    }
}


struct MessageBodyView: View {
    let message: RemoteMessage

      var body: some View {
        HStack {
          VStack {
            Text(message.body)
          }
        }
    }
}

struct MessageBodyView2: View {
    let message: RemoteMessage
      var body: some View {
        HStack {
          VStack {
            Text(message.body)
          }
        }
    }
    
}
struct RemoteView: View {
    @EnvironmentObject var remoteConnectionManager: RemoteConnectionManager
    
    let defaults = UserDefaults.standard
    @State var alldatakey = ["ismoved"]
    @State var alldatastring = ["ismoved"]

  var body: some View {
    VStack {
      RemoteListView()
        .environmentObject(remoteConnectionManager)
      messageField
    }
    .navigationBarBackButtonHidden(true)
  }

  private var messageField: some View {
    VStack(spacing: 0) {
        Text("loading")
      .padding()
    }
  }


}


struct JoinSessionView: View {
    @ObservedObject private var remoteConnectionManager = RemoteConnectionManager()
    @State var teachermode: Bool
    var body: some View {
        VStack(spacing: 24) {
            Text("Loading...")
                .onAppear() {
                    if teachermode == true {
                        remoteConnectionManager.join()
                    } else {
                        remoteConnectionManager.host()
                    }
                }
                NavigationLink(destination: RemoteView().environmentObject(remoteConnectionManager),isActive: $remoteConnectionManager.connectedToRemote) {
                EmptyView()
            }
        }
    }
}

struct RemoteMessage: Identifiable, Equatable, Codable {
  var id = UUID()
  let displayName: String
  let body: String
  var time = Date()

  var isUser: Bool {
    return displayName == UIDevice.current.name
  }
}
