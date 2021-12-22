import SwiftUI

public struct Event: Codable {
    var id: Int
    let name: String
    let startAt: Date
    let endAt: Date?
    let description: String
    let interested: [Member]
    let repeatType: Repeat?
}

public extension Event {
    enum Repeat: Codable {
        case everyWeek
        case everyMonth
    }
}
