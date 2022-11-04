
import Foundation

class PerformanceReporter {
    static let isEnabled = true

    private var reportIndex = 0

    private var frameCount = 0

    private var predictionCount = 0

    private var repeatingTimer: Timer?

    init?() {
        guard PerformanceReporter.isEnabled else { return nil }

        let timer = Timer(timeInterval: 1.0,
                          repeats: true) { [unowned self] _ in
            self.reportToConsole()
        }

        RunLoop.current.add(timer, forMode: .common)

        repeatingTimer = timer
    }

    deinit { repeatingTimer?.invalidate() }

    func incrementFrameCount() { frameCount += 1 }

    func incrementPrediction() { predictionCount += 1 }

    private func reportToConsole() {
        guard  PerformanceReporter.isEnabled else { return }
        reportIndex += 1

        let report = "#\(reportIndex):"
            + " \(predictionCount) action predictions"
            + " across \(frameCount) frames."

        frameCount = 0
        predictionCount = 0

        print(report)

    }
}
