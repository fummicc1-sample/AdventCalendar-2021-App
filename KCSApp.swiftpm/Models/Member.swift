import SwiftUI

public struct Member: Codable, Identifiable {
    public var id: Int
    let userId: String
    let displayName: String
    let notifications: [Event]
}
