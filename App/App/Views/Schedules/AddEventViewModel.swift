import Foundation
import SwiftUI
import Core

@MainActor
class AddEventViewModel: ObservableObject {
    private let store: Database

    @Published var name: String = ""
    @Published var startAt: Date = Date()
    @Published var endAt: Date = Date().addingTimeInterval(24 * 60 * 60)
    @Published var isInterested: Bool = false
    @Published var isRepeat: Bool = false

    var me: Member {
        store.me!
    }

    init(store: Store) {
        self.store = store
    }

    func validateState() -> Bool {
        if startAt > endAt {
            return false
        }
        if name.isEmpty {
            return false
        }
        return true
    }

    func save() async {

        if !validateState() {
            return
        }

        let members: [Member] = isInterested ? [me] : []
        let repeatType: Event.Repeat? = isRepeat ? .everyWeek : nil

        let event = Event(
            id: -1,
            name: name,
            startAt: startAt,
            endAt: endAt,
            interested: members,
            repeatType: repeatType
        )
        await store.persist(event: event)        
    }
}
