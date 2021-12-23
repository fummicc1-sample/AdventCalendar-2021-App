import SwiftUI
import Core

struct EventDetailView: View {

    @ObservedObject var viewModel: EventDetailViewModel
    @EnvironmentObject var store: Store

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
            Button {
            } label: {
                Text("参加する")
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

            } label: {

                Image(systemName: "bell")
            }

        }
    }
}
