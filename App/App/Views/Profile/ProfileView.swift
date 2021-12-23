import SwiftUI
import Core

struct ProfileView: View {

    let member: Member
    let teams: [Team]
    let interestedEvents: [Event]
    @State private var detailEvent: Event?

    var body: some View {
        NavigationView {
            List {
                HStack {
                    Spacer()
                    MemberView(
                        isLeader: false,
                        member: member,
                        didTap: { _ in },
                        length: 96
                    )
                    Spacer()
                }
                .listRowBackground(Color.clear)
                .padding()
                ListItemView(
                    title: "ユーザーID",
                    content: Text(member.userId)
                )
                ListItemView(
                    title: "気になるイベント",
                    content: Group {
                        EventListView(
                            events: interestedEvents,
                            didTapEvent: { event in
                                detailEvent = event
                            },
                            backgroundColor: Color.white
                        ).shadow(radius: 1)
                    }
                )
                NavigationLink("所属班") {
                    TabView {
                        ForEach(teams) { team in
                            TeamDetailView(team: team)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                }
            }.navigationTitle(member.displayName)
        }
        .navigationViewStyle(StackNavigationViewStyle.stack)
    }
}
