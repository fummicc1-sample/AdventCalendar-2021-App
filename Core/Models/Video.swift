import Foundation

public struct VideoId: ExpressibleByStringLiteral, Hashable {
    public let value: String

    public init(stringLiteral value: String) {
        self.value = value
    }

    public init(_ value: String) {
        self.value = value
    }
}

public struct Video: Identifiable {
    public let id: VideoId
    public let title: String
    public let description: String
    public let publishedAt: String
    public let thumbnail: URL
    public let channelId: ChannelId
    public let channelTitle: String

    public init(
        id: VideoId,
        title: String,
        description: String,
        publishedAt: String,
        thumbnail: URL,
        channelId: ChannelId,
        channelTitle: String
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.publishedAt = publishedAt
        self.thumbnail = thumbnail
        self.channelId = channelId
        self.channelTitle = channelTitle
    }
}
