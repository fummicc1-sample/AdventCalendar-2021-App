import SwiftUI

public struct Member: Codable, Identifiable {
    public var id: Int
    public let userId: String
    public let displayName: String
    public let notifications: [Date]
    public let imageUrl: String?
}
