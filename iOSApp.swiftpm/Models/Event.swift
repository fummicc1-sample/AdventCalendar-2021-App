import SwiftUI

public struct Event: Codable, Identifiable {
    public var id: Int
    let name: String
    let startAt: Date
    let endAt: Date?
    let interested: [Member]
    let repeatType: Repeat?
}

public extension Event {
    enum Repeat: String, Codable {
        case everyWeek
        case everyMonth
    }
}
