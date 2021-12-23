import SwiftUI

public struct Member: Codable, Identifiable {
    public init(id: Int, userId: String, displayName: String, notifications: [Date], imageUrl: String?) {
        self.id = id
        self.userId = userId
        self.displayName = displayName
        self.notifications = notifications
        self.imageUrl = imageUrl
    }

    public var id: Int
    public let userId: String
    public let displayName: String
    public let notifications: [Date]
    public let imageUrl: String?
}
