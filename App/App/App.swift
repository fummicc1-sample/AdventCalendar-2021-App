import SwiftUI
import Core

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(StoreImpl())
        }
    }
}
