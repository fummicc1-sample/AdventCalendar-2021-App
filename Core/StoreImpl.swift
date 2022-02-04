import SwiftUI

public protocol Database {
    func refresh() async
    func persist(me: Int) async
    func persist(member: Member) async
    func persist(team: Team) async
    func persist(event: Event) async
    func delete(member: Int) async
    func delete(team: Int) async
    func delete(event: Int) async
}

public protocol DataStore {
    @MainActor var members: [Member] { get }
    @MainActor var teams: [Team] { get }
    @MainActor var events: [Event] { get }
    @MainActor var me: Member? { get }
    @MainActor var myTeams: [Team] { get }
    @MainActor var myEvents: [Event] { get }
}

public typealias Store = Database & DataStore

public actor StoreImpl: ObservableObject {
    @MainActor @Published public var members: [Member] = []
    @MainActor @Published public var teams: [Team] = []
    @MainActor @Published public var events: [Event] = []
    @MainActor @Published public var me: Member?
    @MainActor @Published public var myTeams: [Team] = []
    @MainActor @Published public var myEvents: [Event] = []
    
    private let database: UserDefaults
    
    public init(database: UserDefaults = .standard) {
        self.database = database
    }
    
    private func fetch() {
        Task { @MainActor in
            members = await fetchMembers()
            teams = await fetchTeams()
            events = await fetchEvents()
            // NOTE: this must be called after `members` are updated.
            me = await fetchMe()
            myTeams = await fetchMyTeams()
            myEvents = await fetchMyEvents()
        }
    }
    
    private func fetchMe() async -> Member? {
        let myId: Int = database.object(forKey: "me") as? Int ?? -1
        print("myId", myId)
        let all = await members
        for member in all {
            if member.id == myId {
                return member
            }
        }
        return nil
    }

    private func fetchMyTeams() async -> [Team] {
        guard let me = await self.me else {
            return []
        }
        let teams = await self.teams
        return teams.filter({
            $0.members.contains(where: { member in me.id == member.id })
        })
    }

    private func fetchMyEvents() async -> [Event] {
        guard let me = await self.me else {
            return []
        }
        let events = await self.events
        return events.filter({
            $0.interested.contains(where: { member in member.id == me.id })
        })
    }

    private func fetchMembers() -> [Member] {
        let decoder = Constants.decoder(convertToSnakeCase: true)
        guard let raw = database.string(forKey: "members"),
              let data = raw.data(using: .utf8),
              let members = try? decoder.decode([Member].self, from: data) else {
                  return Constants.defaultMembers
              }
        return members
    }
    
    private func fetchTeams() -> [Team] {
        let decoder = Constants.decoder(convertToSnakeCase: true)
        guard let raw = database.string(forKey: "teams"),
              let data = raw.data(using: .utf8),
              let teams = try? decoder.decode([Team].self, from: data) else {
                  return Constants.defaultTeams
              }
        return teams
    }
    
    private func fetchEvents() -> [Event] {
        let decoder = Constants.decoder(convertToSnakeCase: true)
        guard let raw = database.string(forKey: "events"),
              let data = raw.data(using: .utf8),
              let events = try? decoder.decode([Event].self, from: data) else {
                  return Constants.defaultEvents
              }
        return events
    }
    
    private func save<Value: Encodable>(key: String, value: Value) {
        guard let data = try? Constants
                .encoder(convertToSnakeCase: true).encode(value) else {
            return
        }
        let text = String(data: data, encoding: .utf8)
        database.set(text, forKey: key)
    }

    private func saveSingular(key: String, value: Any) {
        database.set(value, forKey: key)
    }
}

extension StoreImpl: Store {
    public func delete(member: Int) async {
        if let index = await members.firstIndex(where: { $0.id == member }) {
            let members: [Member] = await MainActor.run {
                self.members.remove(at: index)
                return self.members
            }
            save(key: "members", value: members)
            await refresh()
        }
    }
    
    public func delete(team: Int) async {
        if let index = await teams.firstIndex(where: { $0.id == team }) {
            let teams: [Team] = await MainActor.run {
                self.teams.remove(at: index)
                return self.teams
            }
            save(key: "teams", value: teams)
            await refresh()
        }
    }
    
    public func delete(event: Int) async {
        if let index = await events.firstIndex(where: { $0.id == event }) {
            let events: [Event] = await MainActor.run {
                self.events.remove(at: index)
                return self.events
            }
            save(key: "events", value: events)
            await refresh()
        }
    }
    
    public func persist(member: Member) async {
        var member = member
        var all = fetchMembers()
        if let index = all.firstIndex(where: { $0.id == member.id }) {
            all[index] = member
        } else {
            member.id = all.endIndex + 1
            all.append(member)
        }
        save(key: "members", value: all)
        await refresh()
    }
    
    public func persist(team: Team) async {
        var team = team
        var all = fetchTeams()
        if let index = all.firstIndex(where: { $0.id == team.id }) {
            all[index] = team
        } else {
            team.id = all.endIndex + 1
            all.append(team)
        }
        save(key: "teams", value: all)
        await refresh()
    }
    
    public func persist(event: Event) async {
        var event = event
        var all = fetchEvents()
        if let index = all.firstIndex(where: { $0.id == event.id }) {
            all[index] = event
        } else {
            event.id = all.endIndex + 1
            all.append(event)
        }
        save(key: "events", value: all)
        await refresh()
    }
    
    public func persist(me: Int) async {
        saveSingular(key: "me", value: me)
        await refresh()
    }
    
    public func refresh() async {
        fetch()
    }
}
