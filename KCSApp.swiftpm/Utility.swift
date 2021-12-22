import SwiftUI

// https://developer.apple.com/documentation/swift/strideable
extension Date: Strideable {
}

extension Date: Identifiable {
    public var id: Double {
        timeIntervalSince1970
    }
}
