import Foundation

public struct PlaylistId: ExpressibleByStringLiteral, Hashable {
    public let value: String

    public init(stringLiteral value: String) {
        self.value = value
    }

    public init(_ value: String) {
        self.value = value
    }
}

public struct Playlist: Identifiable {
    public var id: PlaylistId
    public var title: String
    public var thumbnail: URL
    public var description: String
    public var publishedAt: String
    public var channelTitle: String

    public init(
        id: PlaylistId,
        title: String,
        thumbnail: URL,
        description: String,
        publishedAt: String,
        channelTitle: String
    ) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.description = description
        self.publishedAt = publishedAt
        self.channelTitle = channelTitle
    }
}
