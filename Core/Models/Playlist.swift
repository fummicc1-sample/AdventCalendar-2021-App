import Foundation

public struct PlaylistId: ExpressibleByStringLiteral {
    public let rawValue: String

    public init(stringLiteral value: String) {
        self.rawValue = value
    }
}

public struct Playlist {
    public var id: PlaylistId
    public var videos: [VideoId]

    public init(id: PlaylistId, videos: [VideoId] = []) {
        self.id = id
        self.videos = videos
    }
}
