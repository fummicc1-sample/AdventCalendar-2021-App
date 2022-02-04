import SwiftUI

public struct AnimatableTap<Content: View>: View {

    public init(onPressed: @escaping () -> Void, content: Content) {
        self.onPressed = onPressed
        self.content = content
    }

    public let onPressed: () -> Void
    public let content: Content

    @GestureState private var isHover: Bool = false
    @State private var isTap: Bool = false

    public var body: some View {
        let dragGesture = DragGesture(minimumDistance: 0)
            .updating($isHover) { _, gesture, _ in
                gesture = true
            }
        content
            .scaleEffect(isTap ? 1.1 : 1)
            .gesture(dragGesture)
            .onTapGesture {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                    isTap = true
                }
            }
    }
}
