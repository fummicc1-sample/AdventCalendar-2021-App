import SwiftUI
import Core

struct ProfilePage: View {

    let member: Member
    let teams: [Team]
    let interestedEvents: [Event]


    var body: some View {
        NavigationView {
            ProfileView(
                member: member,
                teams: teams,
                interestedEvents: interestedEvents
            )
        }.navigationViewStyle(StackNavigationViewStyle.stack)
    }
}

