import SwiftUI
import Core

struct EventListView: View {

    let events: [Event]
    let didTapEvent: (Event) -> Void
    let backgroundColor: Color

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(events) { event in
                    VStack {
                        Spacer().frame(height: 4)
                        Text(event.name).bold().font(.title3)
                        Text(event.startAt, style: .time).bold().font(.title3)
                        if let endAt = event.endAt {
                            Image(systemName: "arrow.down")
                            Text(endAt, style: .time).bold().font(.title3)
                        }
                    }
                    .padding()
                    .onTapGesture {
                        didTapEvent(event)
                    }
                    .background(backgroundColor)
                    .cornerRadius(16)
                }
            }
        }
    }
}
