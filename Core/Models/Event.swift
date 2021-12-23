import SwiftUI

public struct Event: Codable, Identifiable {
    public init(id: Int, name: String, startAt: Date, endAt: Date?, interested: [Member], repeatType: Event.Repeat?) {
        self.id = id
        self.name = name
        self.startAt = startAt
        self.endAt = endAt
        self.interested = interested
        self.repeatType = repeatType
    }

    public var id: Int
    public let name: String
    public let startAt: Date
    public let endAt: Date?
    public let interested: [Member]
    public let repeatType: Repeat?
}

public extension Event {
    enum Repeat: String, Codable {
        case everyWeek
        case everyMonth
    }
}
