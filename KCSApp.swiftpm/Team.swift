import SwiftUI

public struct Team: Codable {
    let members: [Member]
    let leader: Member
    let name: String
}
