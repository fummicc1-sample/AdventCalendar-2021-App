import SwiftUI

public struct Team: Codable, Identifiable {
    public var id: Int
    let members: [Member]
    let leader: Member
    let name: String
}

public extension Team {
    var imageName: String? {
        switch name {
            case "Game班":
            return "Icon-game"
            case "Web班":
            return "Icon-web"
            case "AI班":
            return "Icon-ai"
            default:
            return nil
        }
    }
}
