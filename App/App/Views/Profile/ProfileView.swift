import SwiftUI
import Core

struct ProfileView: View {

    let member: Member
    let teams: [Team]
    let interestedEvents: [Event]

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
            }.navigationTitle(member.displayName)
        }
        .navigationViewStyle(StackNavigationViewStyle.stack)
    }
}
