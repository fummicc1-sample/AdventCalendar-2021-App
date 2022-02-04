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
    public init(id: ChannelId) {
        self.id = id
    }

    public var id: ChannelId
}
