import SwiftUI
import Core

struct EventDetailView: View {

    @ObservedObject var viewModel: EventDetailViewModel
    @EnvironmentObject var store: StoreImpl

    var body: some View {
        VStack {
            HStack {
                Text(viewModel.event.startAt, style: .time).bold().font(.title3)
                if let endAt = viewModel.event.endAt {
                    Image(systemName: "arrow.right")
                    Text(endAt, style: .time).bold().font(.title3)
                }
            }
            .padding()
            Text("興味ありメンバー")
            LazyHGrid(rows: [GridItem(.fixed(90))], content: {
                ForEach(viewModel.event.interested) { member in
                    MemberView(
                        isLeader: false,
                        member: member,
                        didTap: { member in
                            viewModel.showDetailMember = member
                        },
                        length: 40
                    )
                }
            })
            Button {
                viewModel.didTapInterestButton()
            } label: {
                let message = viewModel.isJoining ? "参加を取り消す" : "参加する"
                Text(message)
                    .foregroundColor(Color.white)
                    .bold()
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 48)
            .background(Color.accentColor)
            .cornerRadius(8)
        }
        .navigationTitle(viewModel.event.name)
        .toolbar {
            Button {
                viewModel
            } label: {
                let imageName = viewModel.isNotificationEnabled ? "bell.fill" : "bell"
                Image(systemName: imageName)
            }
        }
        .sheet(item: $viewModel.showDetailMember) {
        } content: { member in
            ProfileView(
                member: member,
                teams: [],
                interestedEvents: []
            )
        }

    }
}
