import Foundation

public struct PlaylistItemsResponse: Codable {
    public let items: [Item]
}

public extension PlaylistItemsResponse {
    struct Item: Codable {
        public let id: String
        public let snippet: Snippet
    }

    struct Snippet: Codable {
        public let publishedAt: Date
        public let channelId: String
        public let title: String
        public let description: String
        public let thumbnails: Thumbnails
        public let channelTitle: String
        public let playlistId: String
        public let position: Int
        public let resourceId: ResourceId
    }

    struct ResourceId: Codable {
        public let videoId: String
    }

    struct Thumbnails: Codable {
        public let `default`: Thumbnail
        public let medium: Thumbnail
        public let high: Thumbnail
    }

    struct Thumbnail: Codable {
        public let url: String
        public let width: Int
        public let height: Int
    }
}
