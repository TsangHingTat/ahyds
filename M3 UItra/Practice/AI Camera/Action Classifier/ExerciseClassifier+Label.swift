
extension ExerciseClassifier {
    
    enum Label: String, CaseIterable {
        case up = "1"
        case down = "0"

        
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
    
    enum Label: String, CaseIterable {
        case up = "1"
        case down = "0"

        
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
