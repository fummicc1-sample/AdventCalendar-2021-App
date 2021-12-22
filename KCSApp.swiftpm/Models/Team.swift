import SwiftUI

public struct Team: Codable, Identifiable {
    public var id: Int
    let members: [Member]
    let leader: Member
    let name: String
}
