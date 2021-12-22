import SwiftUI

public struct Team: Codable {
    var id: Int
    let members: [Member]
    let leader: Member
    let name: String
}
