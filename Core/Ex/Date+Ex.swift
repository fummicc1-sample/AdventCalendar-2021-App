import Foundation

public extension Date {
    // TODO: Apply correct format.
    func displayable() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}
