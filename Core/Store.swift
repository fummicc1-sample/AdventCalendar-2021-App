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

public actor Store: ObservableObject {
    @MainActor @Published public var members: [Member] = []
    @MainActor @Published public var teams: [Team] = []
    @MainActor @Published public var events: [Event] = []
    @MainActor @Published public var me: Member?
    
    private let database: UserDefaults
    
    public init(database: UserDefaults = .standard) {
        self.database = database
    }
    
    public func fetch() {
        Task { @MainActor in
            members = await fetchMembers()
            teams = await fetchTeams()
            events = await fetchEvents()
            // NOTE: this must be called after `members` are updated.
            me = await fetchMe()
            print("me", me as Any)
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
    
    private func fetchMembers() -> [Member] {
        let decoder = Constants.decoder
        guard let raw = database.string(forKey: "members"),
              let data = raw.data(using: .utf8),
              let members = try? decoder.decode([Member].self, from: data) else {
                  return Constants.defaultMembers
              }
        return members
    }
    
    private func fetchTeams() -> [Team] {
        let decoder = Constants.decoder
        guard let raw = database.string(forKey: "teams"),
              let data = raw.data(using: .utf8),
              let teams = try? decoder.decode([Team].self, from: data) else {
                  return Constants.defaultTeams
              }
        return teams
    }
    
    private func fetchEvents() -> [Event] {
        let decoder = Constants.decoder
        guard let raw = database.string(forKey: "events"),
              let data = raw.data(using: .utf8),
              let events = try? decoder.decode([Event].self, from: data) else {
                  return Constants.defaultEvents
              }
        return events
    }
    
    private func save<Value: Encodable>(key: String, value: Value) {
        guard let data = try? Constants.encoder.encode(value) else {
            return
        }
        let text = String(data: data, encoding: .utf8)
        database.set(text, forKey: key)
    }

    private func saveSingular(key: String, value: Any) {
        database.set(value, forKey: key)
    }
}

extension Store: Database {
    public func delete(member: Int) async {
        if let index = await members.firstIndex(where: { $0.id == member }) {
            let members: [Member] = await MainActor.run {
                self.members.remove(at: index)
                return self.members
            } 
            save(key: "members", value: members)
        }
    }
    
    public func delete(team: Int) async {
        if let index = await teams.firstIndex(where: { $0.id == team }) {
            let teams: [Team] = await MainActor.run {
                self.teams.remove(at: index)
                return self.teams
            }
            save(key: "teams", value: teams)
        }
    }
    
    public func delete(event: Int) async {
        if let index = await events.firstIndex(where: { $0.id == event }) {
            let events: [Event] = await MainActor.run {
                self.events.remove(at: index)
                return self.events
            }
            save(key: "events", value: events)
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
        save(key: "members", value: all)
    }
    
    public func persist(me: Int) async {
        saveSingular(key: "me", value: me)
        let new = await fetchMe()
        await MainActor.run { 
            self.me = new
        }
    }
    
    public func refresh() async {
        fetch()
    }
}
