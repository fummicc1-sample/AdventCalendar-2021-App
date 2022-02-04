import Foundation

public struct ChannelId: ExpressibleByStringLiteral, Hashable {
    public let value: String

    public init(stringLiteral value: String) {
        self.value = value
    }

    public init(_ value: String) {
        self.value = value
    }
}

public struct Channel: Identifiable, Hashable {
    public init(
        id: ChannelId,
        name: String,
        thumbnail: URL
    ) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
    }

    public var id: ChannelId
    public var name: String
    public var thumbnail: URL
}
