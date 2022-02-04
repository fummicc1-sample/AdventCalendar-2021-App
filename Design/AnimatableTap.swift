import SwiftUI

public struct AnimatableTap<Content: View>: View {

    public init(onPressed: @escaping () -> Void, content: Content) {
        self.onPressed = onPressed
        self.content = content
    }

    public let onPressed: () -> Void
    public let content: Content

    @State private var isTap: Bool = false

    public var body: some View {
        content
            .scaleEffect(isTap ? 1.2 : 1)
            .onTapGesture {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                    isTap.toggle()
                }
            }
    }
}
