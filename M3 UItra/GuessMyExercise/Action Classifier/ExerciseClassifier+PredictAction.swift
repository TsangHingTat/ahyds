/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Provides a convenience method that makes a prediction from a multiarray window.
*/

import CoreML

extension ExerciseClassifier {
    /// Predicts an action from a series of landmarks' positions over time.
    /// - Parameter window: An `MLMultiarray` that contains the locations of a
    /// person's body landmarks for multiple points in time.
    /// - Returns: An `ActionPrediction`.
    /// - Tag: predictActionFromWindow
    func predictActionFromWindow(_ window: MLMultiArray) -> ActionPrediction {
        do {
            let output = try prediction(poses: window)
            let action = Label(output.label)
            let confidence = output.labelProbabilities[output.label]!
            getdata().savedefaultsdata(type: "action", data: output.label)
            getdata().savedefaultsdataint(type: "confidence", data: Int(Int((output.labelProbabilities[output.label] ?? 0)*100)))
            return ActionPrediction(label: action.rawValue, confidence: confidence)

        } catch {
            fatalError("Exercise Classifier prediction error: \(error)")
        }
    }
}
