import Foundation

public struct VideoResponse: Codable {
    public let items: [Item]
}

public extension VideoResponse {
    struct Item: Codable {
        public let id: String
        public let snippet: Snippet
        public let contentDetails: ContentDetails
    }

    struct Snippet: Codable {
        public let publishedAt: Date
        public let channelId: String
        public let title: String
        public let description: String
        public let thumbnails: Thumbnails
    }

    struct ContentDetails: Codable {
        public let duration: String
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
