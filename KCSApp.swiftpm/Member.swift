import SwiftUI

public struct Member: Codable {
    let userId: String
    let displayName: String
    let notifications: [Event]
}
