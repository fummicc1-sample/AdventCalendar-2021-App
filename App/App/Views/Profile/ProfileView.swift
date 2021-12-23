import SwiftUI
import Core

struct ProfileView: View {

    let member: Member

    var body: some View {
        NavigationView {
            List {
                ListItemView(
                    title: "ユーザーID",
                    content: Text(member.userId)
                )
            }.navigationTitle(member.displayName)
        }
    }
}
