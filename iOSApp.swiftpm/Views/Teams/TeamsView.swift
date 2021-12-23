import SwiftUI

struct TeamsView: View {
    @EnvironmentObject var store: Store
    
    @State private var selectedTeam: Team?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.teams) { team in
                    HStack {
                        Spacer()
                        TeamCard(
                            didTap: { team in 
                                selectedTeam = team
                                print("selectedTeam", selectedTeam as Any)
                            },
                            team: team
                        )
                        Spacer()
                    }.padding()
                }
                .listRowSeparator(.hidden)
                
                NavigationLink(isActive: Binding(
                    get: {
                        return selectedTeam != nil
                    }, set: { isSelected in
                        if !isSelected {
                            selectedTeam = nil 
                        }
                    }
                )) {
                    TeamDetailView(team: selectedTeam)
                } label: { 
                    EmptyView()
                }
            }
            .listStyle(PlainListStyle())
            .padding()
            .navigationBarTitle("班を選択")
        }.navigationViewStyle(StackNavigationViewStyle.stack)
    }
}

struct TeamCard: View {
    let didTap: (Team) -> Void
    let team: Team
    
    var body: some View {
        ZStack {
            Image(team.imageName!)
                .resizable()
                .scaledToFill()
            VStack {
                Text(team.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.accentColor)
                    .shadow(
                        color: .black, 
                        radius: 2,
                        x: 0,
                        y: 2
                    )
                HStack {
                    MemberView(
                        isLeader: true, 
                        member: team.leader
                    )
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
                }.frame(height: 48)
            }.padding()
        }
        .frame(width: 200, height: 200)
        .clipShape(Circle())
        .onTapGesture {
            didTap(team)
        }
    }
}
