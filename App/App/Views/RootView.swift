import SwiftUI
import Core

struct RootView: View {
    
    @EnvironmentObject var store: Store
    @State private var selectedTag: Int = 1
    
    var body: some View {
        VStack {
            if let me = store.me {
                TabView(selection: $selectedTag) {
                    CalendarView(year: 2021)
                        .tabItem {
                            Label("カレンダー", systemImage: "calendar")
                        }.tag(1)
                    TeamsView(showNavigation: true)
                        .tabItem {
                            Label("班", systemImage: "rectangle.3.group")
                        }.tag(2)
                    ProfileView(
                        member: me,
                        teams: store.myTeams,
                        interestedEvents: store.myEvents
                    ).tabItem {
                        Label("プロフィール", systemImage: "person.circle")
                    }.tag(3)
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


