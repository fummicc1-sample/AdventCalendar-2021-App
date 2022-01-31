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

    public init(id: VideoId) {
        self.id = id
    }
}
