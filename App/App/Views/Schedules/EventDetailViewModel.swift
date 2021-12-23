import Foundation
import Core

class EventDetailViewModel: ObservableObject {

    @Published var isNotificationEnabled: Bool = false

    let database: Database

    let event: Event

    init(database: Database, event: Event) {
        self.database = database
        self.event = event

        Task {
            let me = database.
        }
    }

    func showInterest() {
    }

    func hideInterest() {

    }

    
}
