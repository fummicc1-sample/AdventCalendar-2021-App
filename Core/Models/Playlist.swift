import Foundation

public struct PlaylistId {
    public let rawValue: String

    public init(id: String) {
        self.rawValue = id
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
