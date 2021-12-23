import SwiftUI
import Core

struct EventDetailView: View {

    let event: Event

    @ObservedObject var viewModel: EventDetailViewModel
    @EnvironmentObject var store: Store

    var body: some View {
        VStack {
        }
        .navigationTitle(event.name)
    }
}
