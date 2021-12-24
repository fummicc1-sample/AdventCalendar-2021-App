import Foundation
import Core

@MainActor
class EventDetailViewModel: ObservableObject {

    @Published var isNotificationEnabled: Bool = false
    @Published var isJoining: Bool = false
    @Published var showDetailMember: Member?

    let database: Store

    var event: Event

    init(database: Store, event: Event) {
        self.database = database
        self.event = event

        guard let me = database.me else {
            return
        }
        isNotificationEnabled = me.notifications.contains(where: {
            $0 == event.startAt
        })
        isJoining = event.interested.contains(where: {
            $0.id == me.id
        })
    }

    private func showInterest() {
        Task {
            guard let me = database.me else {
                return
            }
            event.interested.append(me)
            await database.persist(event: event)
        }
    }

    private func hideInterest() {
        Task {
            guard let me = database.me else {
                return
            }
            event.interested.removeAll(where: { $0.id == me.id })
            await database.persist(event: event)
        }
    }

    func didTapInterestButton() {
        if isJoining {
            hideInterest()
        } else {
            showInterest()
        }
    }

    func didTapNotificationButton() {
        if isNotificationEnabled {

        }
    }

    private func removeNotification(id: Int) {

    }
}
