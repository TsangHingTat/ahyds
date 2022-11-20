//
//  Push-up.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 6/11/2022.
//

import CoreML


@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
class ExerciseClassifierInput : MLFeatureProvider {

    var poses: MLMultiArray

    var featureNames: Set<String> {
        get {
            return ["poses"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "poses") {
            return MLFeatureValue(multiArray: poses)
        }
        return nil
    }
    
    init(poses: MLMultiArray) {
        self.poses = poses
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    convenience init(poses: MLShapedArray<Float>) {
        self.init(poses: MLMultiArray(poses))
    }

}


@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
class ExerciseClassifierOutput : MLFeatureProvider {

    private let provider : MLFeatureProvider

    var labelProbabilities: [String : Double] {
        return self.provider.featureValue(for: "labelProbabilities")!.dictionaryValue as! [String : Double]
    }

    var label: String {
        return self.provider.featureValue(for: "label")!.stringValue
    }

    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    init(labelProbabilities: [String : Double], label: String) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["labelProbabilities" : MLFeatureValue(dictionary: labelProbabilities as [AnyHashable : NSNumber]), "label" : MLFeatureValue(string: label)])
    }

    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
class ExerciseClassifier {
    let model: MLModel

    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        if getdata().getdefaultsdata(type: "mlmodel") == "" {
            return bundle.url(forResource: "push-up", withExtension:"mlmodelc")!
        } else {
            return bundle.url(forResource: "\(getdata().getdefaultsdata(type: "mlmodel"))", withExtension:"mlmodelc")!
        }
        
    }

    init(model: MLModel) {
        self.model = model
    }

    @available(*, deprecated, message: "Use init(configuration:) instead and handle errors appropriately.")
    convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }

    convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }


    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }

    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<ExerciseClassifier, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> ExerciseClassifier {
        return try await self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<ExerciseClassifier, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(ExerciseClassifier(model: model)))
            }
        }
    }


    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> ExerciseClassifier {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return ExerciseClassifier(model: model)
    }


    func prediction(input: ExerciseClassifierInput) throws -> ExerciseClassifierOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    func prediction(input: ExerciseClassifierInput, options: MLPredictionOptions) throws -> ExerciseClassifierOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return ExerciseClassifierOutput(features: outFeatures)
    }

    func prediction(poses: MLMultiArray) throws -> ExerciseClassifierOutput {
        let input_ = ExerciseClassifierInput(poses: poses)
        return try self.prediction(input: input_)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func prediction(poses: MLShapedArray<Float>) throws -> ExerciseClassifierOutput {
        let input_ = ExerciseClassifierInput(poses: poses)
        return try self.prediction(input: input_)
    }

    func predictions(inputs: [ExerciseClassifierInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [ExerciseClassifierOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [ExerciseClassifierOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  ExerciseClassifierOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
