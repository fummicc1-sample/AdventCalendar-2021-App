import Foundation
import Core

class EventDetailViewModel: ObservableObject {

    @Published var isNotificationEnabled: Bool = false

    let database: Store

    var event: Event

    init(database: Store, event: Event) {
        self.database = database
        self.event = event

        Task {
            guard let me = await database.me else {
                return
            }
            isNotificationEnabled = me.notifications.contains(where: {
                $0 == event.startAt
            })
        }
    }

    func showInterest() {
        Task {
            guard let me = await database.me else {
                return
            }
            event.interested.append(me)
            await database.persist(event: event)
        }
    }

    func hideInterest() {

    }

    
}
