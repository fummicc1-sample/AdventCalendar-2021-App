import SwiftUI

public protocol Database {
    func refresh() async
    func persist(member: Member) async
    func persist(team: Team) async
    func persist(event: Event) async
    func delete(member: Int) async
    func delete(team: Int) async
    func delete(event: Int) async
}

public actor Store: ObservableObject {
    public var members: [Member] = []
    public var teams: [Team] = []
    public var events: [Event] = []
    
    private let database: UserDefaults
    
    public init(database: UserDefaults = .standard) {
        self.database = database
    }
    
    public func fetch() {
        members = fetchMembers()
        teams = fetchTeams()
        events = fetchEvents()
    }
    
    private func fetchMembers() -> [Member] {
        let decoder = Constants.decoder
        guard let raw = database.string(forKey: "members"),
              let data = raw.data(using: .utf8),
              let members = try? decoder.decode([Member].self, from: data) else {
                  print("No Members")
                  return []
              }
        return members
    }
    
    private func fetchTeams() -> [Team] {
        let decoder = Constants.decoder
        guard let raw = database.string(forKey: "teams"),
              let data = raw.data(using: .utf8),
              let teams = try? decoder.decode([Team].self, from: data) else {
                  print("No Members")
                  return []
              }
        return teams
    }
    
    private func fetchEvents() -> [Event] {
        let decoder = Constants.decoder
        guard let raw = database.string(forKey: "events"),
              let data = raw.data(using: .utf8),
              let events = try? decoder.decode([Event].self, from: data) else {
                  print("No Members")
                  return []
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
}

extension Store: Database {
    public func delete(member: Int) async {
        if let index = members.firstIndex(where: { $0.id == member }) {
            members.remove(at: index)
            save(key: "members", value: members)
        }
    }

    public func delete(team: Int) async {
        if let index = teams.firstIndex(where: { $0.id == team }) {
            teams.remove(at: index)
            save(key: "teams", value: teams)
        }
    }

    public func delete(event: Int) async {
        if let index = events.firstIndex(where: { $0.id == event }) {
            events.remove(at: index)
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

    public func refresh() async {
        fetch()
    }
}
