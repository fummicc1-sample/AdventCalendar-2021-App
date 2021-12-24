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
    public var userId: String
    public var displayName: String
    public var notifications: [Date]
    public var imageUrl: String?
}
