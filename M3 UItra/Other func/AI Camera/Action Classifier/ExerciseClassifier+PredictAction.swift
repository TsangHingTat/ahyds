//
//  ExerciseClassifier+PredictAction.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 31/8/2022.
//

import CoreML

extension ExerciseClassifier {
    
    func predictActionFromWindow(_ window: MLMultiArray) -> ActionPrediction {
        do {
            let output = try prediction(poses: window)
            let action = Label(output.label)
            let confidence = output.labelProbabilities[output.label]!
            GetData().savedefaultsdata(type: "action", data: output.label)
            GetData().savedefaultsdataint(type: "confidence", data: Int(Int((output.labelProbabilities[output.label] ?? 0)*100)))
            return ActionPrediction(label: action.rawValue, confidence: confidence)

        } catch {
            fatalError("Exercise Classifier prediction error: \(error)")
        }
    }
}


extension ExerciseClassifier {
    
    static let shared: ExerciseClassifier = {
        
        let defaultConfig = MLModelConfiguration()

        
        guard let exerciseClassifier = try? ExerciseClassifier(configuration: defaultConfig) else {
            
            fatalError("Exercise Classifier failed to initialize.")
        }

        
        exerciseClassifier.checkLabels()

        return exerciseClassifier
    }()
}

extension ExerciseClassifier {
    
    enum Label: String, CaseIterable {
        case situp_up = "01"
        case situp_down = "00"
        case push_up = "11"
        case push_down = "10"

        
        case otherAction = "Other Action"

        
        init(_ string: String) {
            guard let label = Label(rawValue: string) else {
                let typeName = String(reflecting: Label.self)
                fatalError("Add the `\(string)` label to the `\(typeName)` type.")
            }

            self = label
        }
    }
}


extension ExerciseClassifier {
    
    func checkLabels() {
        let metadata = model.modelDescription.metadata
        guard let classLabels = model.modelDescription.classLabels else {
            fatalError("The model doesn't appear to be a classifier.")
        }

        print("Checking the class labels in `\(Self.self)` model:")

        if let author = metadata[.author] {
            print("\tAuthor: \(author)")
        }

        if let description = metadata[.description] {
            print("\tDescription: \(description)")
        }

        if let version = metadata[.versionString] {
            print("\tVersion: \(version)")
        }

        if let license = metadata[.license] {
            print("\tLicense: \(license)")
        }

        print("Labels:")
        for (number, modelLabel) in classLabels.enumerated() {
            guard let modelLabelString = modelLabel as? String else {
                print("The label `\(modelLabel)` is not a string.")
                fatalError("Action classifier labels should be strings.")
            }

            
            let label = Label(modelLabelString)
            print("  \(number): \(label.rawValue)")
        }

        if Label.allCases.count != classLabels.count {
            let difference = Label.allCases.count - classLabels.count
            print("Warning: \(Label.self) contains \(difference) extra class labels.")
        }
    }
}


extension ExerciseClassifier {
    
    static let frameRate = 30.0
    
    func calculatePredictionWindowSize() -> Int {
        let modelDescription = model.modelDescription

        let modelInputs = modelDescription.inputDescriptionsByName
        assert(modelInputs.count == 1, "The model should have exactly 1 input")

        guard let  input = modelInputs.first?.value else {
            fatalError("The model must have at least 1 input.")
        }

        guard input.type == .multiArray else {
            fatalError("The model's input must be an `MLMultiArray`.")
        }

        guard let multiArrayConstraint = input.multiArrayConstraint else {
            fatalError("The multiarray input must have a constraint.")
        }

        let dimensions = multiArrayConstraint.shape
        guard dimensions.count == 3 else {
            fatalError("The model's input multiarray must be 3 dimensions.")
        }

        let windowSize = Int(truncating: dimensions.first!)
        let frameRate = ExerciseClassifier.frameRate

        let timeSpan = Double(windowSize) / frameRate
        let timeString = String(format: "%0.2f second(s)", timeSpan)
        let fpsString = String(format: "%.0f fps", frameRate)
        print("Window is \(windowSize) frames wide, or \(timeString) at \(fpsString).")

        return windowSize
    }
}


struct ActionPrediction {
    
    let label: String

    
    let confidence: Double!

    
    var confidenceString: String? {
        guard let confidence = confidence else {
            return nil
        }

        
        let percent = confidence * 100
        let formatString = percent >= 99.5 ? "%2.0f %%" : "%2.1f %%"
        return String(format: formatString, percent)
    }

    init(label: String, confidence: Double) {
        self.label = label
        self.confidence = confidence
    }
}

extension ActionPrediction {
    
    private enum AppLabel: String {
        case starting = "Starting Up"
        case noPerson = "No Person"
        case lowConfidence = "Low Confidence"
    }

    
    static let startingPrediction = ActionPrediction(.starting)

    
    static let noPersonPrediction = ActionPrediction(.noPerson)

    
    static let lowConfidencePrediction = ActionPrediction(.lowConfidence)

    
    private init(_ otherLabel: AppLabel) {
        label = otherLabel.rawValue
        confidence = nil
    }
    
    var isModelLabel: Bool { !isAppLabel }

    
    var isAppLabel: Bool { confidence == nil }
}
