import SwiftUI

// https://developer.apple.com/documentation/swift/strideable
extension Date: Strideable {
}

extension Date: Identifiable {
    public var id: Double {
        timeIntervalSince1970
    }
}

// https://stackoverflow.com/questions/57315409/push-view-programmatically-in-callback-swiftui
public extension View {
    func navigatePush(whenTrue toggle: Binding<Bool>) -> some View {
        NavigationLink(
            destination: self,
            isActive: toggle
        ) { EmptyView() }
    }
    
    func navigatePush<H: Hashable>(when binding: Binding<H>,
                                   matches: H) -> some View {
        NavigationLink(
            destination: self,
            tag: matches,
            selection: Binding<H?>(binding)
        ) { EmptyView() }
    }
    
    func navigatePush<H: Hashable>(whenNotNil binding: Binding<H?>) -> some View {
        NavigationLink(
            destination: self,
            isActive: Binding<Bool>(
                get: {
                    binding.wrappedValue != nil
                }, set: { isNotNil, _ in
                    if !isNotNil {
                        binding.wrappedValue = nil
                    }
                })
        ) { EmptyView() }
    }
}
