import SwiftUI

struct TeamDetailView: View {
    let team: Team
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("メンバーリスト")
                        .layoutPriority(1)
                    Spacer()
                    LazyHGrid(
                        rows: [GridItem(.fixed(48))]
                    ) { 
                        MemberView(isLeader: true, member: team.leader)
                        ForEach(team.members) { member in
                            let isLeader = team.leader.id == member.id
                            if isLeader {
                                EmptyView()
                            } else {
                                MemberView(
                                    isLeader: isLeader, 
                                    member: member
                                )
                            }
                        }
                    }
                }
            }
            .navigationTitle(team.name)
        }.navigationViewStyle(StackNavigationViewStyle.stack)
    }
}
