

import UIKit

struct ChatMessage: Identifiable, Equatable, Codable {
    var id = UUID()
    let displayName: String
    let body: String
    var time = Date()
    
}

