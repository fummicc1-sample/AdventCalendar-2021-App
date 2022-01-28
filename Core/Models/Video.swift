import Foundation

public struct Video: Codable {
    public let id: String

    public init(id: String) {
        self.id = id
    }
}
