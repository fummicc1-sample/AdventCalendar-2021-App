import Foundation

public struct VideoId: ExpressibleByStringLiteral {
    public let rawValue: String

    public init(stringLiteral value: String) {
        self.rawValue = value
    }
}

public struct Video {
    public let id: VideoId

    public init(id: VideoId) {
        self.id = id
    }
}
