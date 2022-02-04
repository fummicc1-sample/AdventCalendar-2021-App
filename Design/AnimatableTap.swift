import SwiftUI

// TODO: Not Working
public struct AnimatableTap<Content: View>: View {

    public init(onPressed: @escaping () -> Void, content: Content) {
        self.onPressed = onPressed
        self.content = content
    }

    public let onPressed: () -> Void
    public let content: Content

    @GestureState var inTap = false

    public var body: some View {
        let gesture = LongPressGesture(minimumDuration: 0, maximumDistance: 4)
            .updating($inTap) { current, state, _ in
                state = current
            }
            .onEnded { value in
                onPressed()
            }
        content
            .scaleEffect(inTap ? 0.8 : 1)
            .opacity(inTap ? 0.8 : 1)
            .simultaneousGesture(gesture)
    }
}
