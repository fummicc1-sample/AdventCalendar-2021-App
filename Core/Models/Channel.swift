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
    public init(id: ChannelId) {
        self.id = id
    }

    public var id: ChannelId
}
