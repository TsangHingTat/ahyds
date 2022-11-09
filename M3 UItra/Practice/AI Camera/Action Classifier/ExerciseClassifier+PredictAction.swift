
import CoreML

extension ExerciseClassifier {
    
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

extension ExerciseClassifier {
    
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
