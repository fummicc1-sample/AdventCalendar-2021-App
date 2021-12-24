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
    public var name: String
    public var startAt: Date
    public var endAt: Date?
    public var interested: [Member]
    public var repeatType: Repeat?
}

public extension Event {
    enum Repeat: String, Codable {
        case everyWeek
        case everyMonth
    }
}
