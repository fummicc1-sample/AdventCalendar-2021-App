import Foundation
import Core

public struct VideoCommentId: ExpressibleByStringLiteral, Hashable {
    public let value: String

    public init(stringLiteral value: String) {
        self.value = value
    }

    public init(_ value: String) {
        self.value = value
    }
}

public struct VideoComment: Identifiable {
    public var id: VideoCommentId
    public var point: Point
    public var message: String
    public var sender: Member
}

public extension VideoComment {
    struct Point {
        public init(hour: Int, minute: Int, second: Int, date: Date) {
            self.hour = hour
            self.minute = minute
            self.second = second
            self.date = date
        }

        public var hour: Int
        public var minute: Int
        public var second: Int
        public var date: Date

        public var text: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss"
            return formatter.string(from: date)
        }
    }
}
