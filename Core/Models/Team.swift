import SwiftUI

public struct Team: Codable, Identifiable {
    public init(id: Int, members: [Member], leader: Member, name: String) {
        self.id = id
        self.members = members
        self.leader = leader
        self.name = name
    }

    public var id: Int
    public var members: [Member]
    public var leader: Member
    public var name: String
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
