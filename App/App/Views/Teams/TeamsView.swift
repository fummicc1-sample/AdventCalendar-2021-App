import SwiftUI
import Core

struct TeamsView: View {
    @EnvironmentObject var store: StoreImpl
    
    @State private var selectedTeam: Team?

    var showNavigation: Bool = false
    var iconSize: Double = 160
    
    var body: some View {
        if showNavigation {
            NavigationView {
                content()
                .padding()
                .navigationBarTitle("班を選択")
            }.navigationViewStyle(StackNavigationViewStyle.stack)
        } else {
            content()
                .padding()
        }
    }

    private func content() -> some View {
        VStack {
            if let selectedTeam = selectedTeam {
                TeamDetailView(team: selectedTeam)
                    .navigatePush(
                        when: Binding(
                            get: {
                                selectedTeam.id
                            },
                            set: { id in
                                if id == selectedTeam.id {
                                    self.selectedTeam = nil
                                }
                            }
                        ),
                        matches: selectedTeam.id
                    )
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(store.teams) { team in
                        TeamCard(
                            didTap: { team in
                                selectedTeam = team
                            },
                            team: team,
                            iconSize: iconSize
                        ).padding()
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
            }
        }
        .padding()
    }
}

struct TeamCard: View {
    let didTap: (Team) -> Void
    let team: Team
    let iconSize: Double
    
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
                    ) { _ in }
                    ForEach(team.members) { member in
                        let isLeader = team.leader.id == member.id
                        if isLeader {
                            EmptyView()
                        } else {
                            MemberView(
                                isLeader: isLeader, 
                                member: member
                            ) { _ in }
                        }
                    }
                }.frame(height: 48)
            }.padding()
        }
        .frame(width: iconSize, height: iconSize)
        .clipShape(Circle())
        .onTapGesture {
            didTap(team)
        }
    }
}
