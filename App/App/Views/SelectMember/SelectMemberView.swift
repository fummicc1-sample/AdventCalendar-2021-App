import SwiftUI
import Core

struct SelectMemberView: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        NavigationView { 
            List {
                ForEach(store.members) { member in
                    MemberView(
                        isLeader: false,
                        member: member,
                        didTap: { member in
                            Task {
                                await store.persist(me: member.id)
                            }
                        }
                    )
                }
            }
            .navigationTitle("アカウントを選択")
        }.navigationViewStyle(StackNavigationViewStyle.stack)
    }
}
