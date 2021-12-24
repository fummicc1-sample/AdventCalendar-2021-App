import SwiftUI
import Core

struct SelectMemberView: View {
    
    @EnvironmentObject var store: StoreImpl
    
    var body: some View {
        NavigationView { 
            List {
                ForEach(store.members) { member in
                    HStack {
                        MemberView(
                            isLeader: false,
                            member: member,
                            didTap: { _ in }
                        )
                        Text(member.displayName).font(.body)
                    }
                    .onTapGesture {
                        Task {
                            await store.persist(me: member.id)
                        }
                    }
                }
            }
            .navigationTitle("アカウントを選択")
        }.navigationViewStyle(StackNavigationViewStyle.stack)
    }
}
