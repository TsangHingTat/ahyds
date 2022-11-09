
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
