import Foundation

public struct ChannelId: ExpressibleByStringLiteral {
    public let value: String

    public init(stringLiteral value: String) {
        self.value = value
    }

    public init(_ value: String) {
        self.value = value
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
