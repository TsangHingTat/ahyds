
import UIKit
import Vision
import SwiftUI

struct CameraSelfView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MainViewController
    
    func makeUIViewController(context content: Context) -> MainViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "Camera")
        return controller as! MainViewController
    }
    
    func updateUIViewController(_ uiViewController: MainViewController, context: Context) {
        
    }
}



class MainViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!

    @IBOutlet weak var labelStack: UIStackView!

    @IBOutlet weak var actionLabel: UILabel!

    @IBOutlet weak var confidenceLabel: UILabel!

    @IBOutlet weak var buttonStack: UIStackView!

    @IBOutlet weak var summaryButton: UIButton!

    @IBOutlet weak var cameraButton: UIButton!

    var videoCapture: VideoCapture!

    
    var videoProcessingChain: VideoProcessingChain!
    
    var actionFrameCounts = [String: Int]()
}

extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isIdleTimerDisabled = true

        
        let views = [labelStack, buttonStack, cameraButton, summaryButton]
        views.forEach { view in
            view?.layer.cornerRadius = 10
            view?.overrideUserInterfaceStyle = .dark
        }

        
        videoProcessingChain = VideoProcessingChain()
        videoProcessingChain.delegate = self

        videoCapture = VideoCapture()
        videoCapture.delegate = self

        updateUILabelsWithPrediction(.startingPrediction)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        videoCapture.updateDeviceOrientation()
    }

    
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        videoCapture.updateDeviceOrientation()
    }
}

extension MainViewController {
    @IBAction func onCameraButtonTapped(_: Any) {
        videoCapture.toggleCameraSelection()
    }

}

extension MainViewController: VideoCaptureDelegate {
    func videoCapture(_ videoCapture: VideoCapture,
                      didCreate framePublisher: FramePublisher) {
        updateUILabelsWithPrediction(.startingPrediction)
        
        videoProcessingChain.upstreamFramePublisher = framePublisher
    }
}

extension MainViewController: VideoProcessingChainDelegate {
    
    func videoProcessingChain(_ chain: VideoProcessingChain,
                              didPredict actionPrediction: ActionPrediction,
                              for frameCount: Int) {

        if actionPrediction.isModelLabel {
            addFrameCount(frameCount, to: actionPrediction.label)
        }

        updateUILabelsWithPrediction(actionPrediction)
    }

    func videoProcessingChain(_ chain: VideoProcessingChain,
                              didDetect poses: [Pose]?,
                              in frame: CGImage) {
        DispatchQueue.global(qos: .userInteractive).async {
            self.drawPoses(poses, onto: frame)
        }
    }
}

extension MainViewController {
    private func addFrameCount(_ frameCount: Int, to actionLabel: String) {
        let totalFrames = (actionFrameCounts[actionLabel] ?? 0) + frameCount
        actionFrameCounts[actionLabel] = totalFrames
    }

    private func updateUILabelsWithPrediction(_ prediction: ActionPrediction) {
        DispatchQueue.main.async { self.actionLabel.text = prediction.label }
        let confidenceString = prediction.confidenceString ?? "Observing..."
        DispatchQueue.main.async { self.confidenceLabel.text = confidenceString }
    }

    private func drawPoses(_ poses: [Pose]?, onto frame: CGImage) {
        let renderFormat = UIGraphicsImageRendererFormat()
        renderFormat.scale = 1.0

        let frameSize = CGSize(width: frame.width, height: frame.height)
        let poseRenderer = UIGraphicsImageRenderer(size: frameSize,
                                                   format: renderFormat)

        let frameWithPosesRendering = poseRenderer.image { rendererContext in
            
            let cgContext = rendererContext.cgContext
            
            let inverse = cgContext.ctm.inverted()

            cgContext.concatenate(inverse)

            let imageRectangle = CGRect(origin: .zero, size: frameSize)
            cgContext.draw(frame, in: imageRectangle)

            let pointTransform = CGAffineTransform(scaleX: frameSize.width,
                                                   y: frameSize.height)

            guard let poses = poses else { return }

            for pose in poses {
                pose.drawWireframeToContext(cgContext, applying: pointTransform)
            }
        }

        DispatchQueue.main.async { self.imageView.image = frameWithPosesRendering }
    }
}
