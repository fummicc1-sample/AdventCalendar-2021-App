import Foundation

public struct VideoId {
    public let rawValue: String

    public init(id: String) {
        self.rawValue = id
    }
}

public struct Video {
    public let id: VideoId

    public init(id: VideoId) {
        self.id = id
    }
}
