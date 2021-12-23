import SwiftUI
import Core

struct TeamDetailView: View {
    let team: Team
    
    @State private var selectedMember: Member?
    
    var body: some View {
        List {
            HStack {
                Text("メンバーリスト")
                    .layoutPriority(1)
                Spacer()
                LazyHGrid(
                    rows: [GridItem(.fixed(48))]
                ) { 
                    MemberView(
                        isLeader: true,
                        member: team.leader
                    ) { member in
                        selectedMember = member
                    }
                    ForEach(team.members) { member in
                        let isLeader = team.leader.id == member.id
                        if isLeader {
                            EmptyView()
                        } else {
                            MemberView(
                                isLeader: isLeader, 
                                member: member
                            ) { member in
                                selectedMember = member
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(team.name)
    }
}
