import Foundation

public struct ChannelId {
    public let rawValue: String

    public init(id: String) {
        self.rawValue = id
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
