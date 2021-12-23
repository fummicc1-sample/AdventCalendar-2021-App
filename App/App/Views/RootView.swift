import SwiftUI
import Core

struct RootView: View {
    
    @EnvironmentObject var store: Store
    @State private var selectedTag: Int = 1
    
    var body: some View {
        Group {
            if let me = store.me {
                TabView(selection: $selectedTag) {
                    Group {
                        CalendarView(year: 2021)
                    }.tabItem { Label("カレンダー", systemImage: "calendar") }.tag(1)
                    Group {
                        TeamsView()
                    }.tabItem { Label("班", systemImage: "rectangle.3.group") }.tag(2)
                    Group {
                        ProfileView(member: me)
                            .tabItem { Label("プロフィール", systemImage: "person.circle") }.tag(3)
                    }
                }
            } else {
                SelectMemberView()
            }
        }
        .task {
            await store.refresh()
        }
    }
}


