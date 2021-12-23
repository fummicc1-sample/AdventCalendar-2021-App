import SwiftUI

public struct Event: Codable, Identifiable {
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
