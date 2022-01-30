import Foundation

public struct ChannelId: ExpressibleByStringLiteral {
    public let rawValue: String

    public init(stringLiteral value: String) {
        self.rawValue = value
    }
}

public struct Channel {
    public init(id: ChannelId, playlists: [PlaylistId] = []) {
        self.id = id
        self.playlists = playlists
    }

    public var id: ChannelId
    public var playlists: [PlaylistId]
}
