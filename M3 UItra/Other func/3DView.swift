//
//  3DView.swift
//  AppleDeviceInfo
//
//  Created by Hing Tat Tsang on 5/4/2022.
//

import SwiftUI
import SceneKit

struct ThreeDView: View {
    var name: String
    var title: String
    var body: some View {
        
        LegacySceneView(scene: {
            let scene = SCNScene(named: "\(name).usdz")!
                scene.background.contents = UIColor.clear
            return scene
        }(), options: [.autoenablesDefaultLighting,.allowsCameraControl])
        
    }
}

struct LegacySceneView: UIViewRepresentable {
    var scene: SCNScene
    var options: SceneView.Options
    
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.backgroundColor = UIColor.clear
        view.allowsCameraControl = options.contains(.allowsCameraControl)
        view.autoenablesDefaultLighting = options.contains(.autoenablesDefaultLighting)
        view.rendersContinuously = options.contains(.rendersContinuously)
        view.isJitteringEnabled = options.contains(.jitteringEnabled)
        view.isTemporalAntialiasingEnabled = options.contains(.temporalAntialiasingEnabled)
        view.scene = scene
        return view
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) { }
}


struct ThreeDHView: View {
    var name: String
    var title: String
    var body: some View {
//        ScrollView {
//            HStack {
//                Text(title)
//                    .font(.title)
//                    .bold()
//                    .padding()
//                Spacer()
//            }
//            SceneView(scene: SCNScene(named: "\(name).usdz"), options: [.autoenablesDefaultLighting])
//                .edgesIgnoringSafeArea(.bottom)
//                .frame(height: 200)
//            NavigationLink(destination: ThreeD4KView(name: name, title: title)) {
//                Text("View \(title) 3D Model")
//            }
//        }
//        .navigationTitle("")
//        .navigationBarTitleDisplayMode(.inline)
        ThreeD4KView(name: name, title: title)
    }
}

struct ThreeD4KView: View {
    var name: String
    var title: String
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            LegacySceneView(scene: {
                let scene = SCNScene(named: "\(name).usdz")!
                    scene.background.contents = UIColor.clear
                return scene
            }(), options: [.autoenablesDefaultLighting,.allowsCameraControl])
        }
    }
}


struct ViewView: View {
    var name: String
    var title: String
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            NavigationLink {
                ThreeDHView(name: name, title: title)
            } label: {
                VStack(alignment: .center) {
                    ZStack {
                        VStack {
                            ThreeDView(name: name, title: title)
                                .frame(width: 155, height: 155)
                                .cornerRadius(5)
                                .allowsHitTesting(false)
                            Text(title)
                                .foregroundColor(.primary)
                                .font(.caption)
                        }
                        Color.white
                            .opacity(0)
                    }
                }
                .padding(.leading, 15)
            }
        }
    }
}



struct Previews_3DView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
