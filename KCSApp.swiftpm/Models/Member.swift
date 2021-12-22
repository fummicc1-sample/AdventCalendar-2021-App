import SwiftUI

public struct Member: Codable {
    var id: Int
    let userId: String
    let displayName: String
    let notifications: [Event]
}
