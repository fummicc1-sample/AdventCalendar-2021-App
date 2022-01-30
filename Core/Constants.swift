import SwiftUI
import Foundation

public enum Constants {

    // MARK: Internal
    static let youtubeApiKey: String = ProcessInfo.processInfo.environment["youtube_api_key"] ?? ""

    // MARK: Public
    static public let homepage = "https://kcs1959.jp"

    static public let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let data = try! decoder.singleValueContainer().decode(String.self)
            let formatter = ISO8601DateFormatter()
            return formatter.date(from: data)!
        })
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    static public let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .custom({ (date, encoder) in
            let formatter = ISO8601DateFormatter()
            let stringData = formatter.string(from: date)
            var container = encoder.singleValueContainer()
            try container.encode(stringData)
        })
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    private static let membersRawData = """
[
    {
        "id": 0,
        "display_name": "ふみっち",
        "user_id": "fummicc1",
        "notifications": [],
        "image_url": "https://pbs.twimg.com/profile_images/1399287867965272064/wTZprrCx_400x400.jpg"
    },
    {
        "id": 1,
        "display_name": "Fastriver",
        "user_id": "Fastriver_org",
        "notifications": [],
        "image_url": "https://pbs.twimg.com/profile_images/3441612194/6e4db404420235cc8d225d79c6073cc0_400x400.jpeg"
    },
    {
        "id": 2,
        "display_name": "Besshy",
        "user_id": "besshy8",
        "notifications": [],
        "image_url": "https://pbs.twimg.com/profile_images/3441612194/6e4db404420235cc8d225d79c6073cc0_400x400.jpeg"
    },
    {
        "id": 3,
        "display_name": "国民所得倍増計画",
        "user_id": "imcometwotimes",
        "notifications": [],
        "image_url": "https://pbs.twimg.com/profile_images/3441612194/6e4db404420235cc8d225d79c6073cc0_400x400.jpeg"
    }
]
"""
    
    private static let teamsRawData = """
[
    {
        "id": 0,
        "name": "Web班",
        "members": [
            {
                "id": 0,
                "display_name": "ふみっち",
                "user_id": "fummicc1",
                "notifications": [],
                "image_url": "https://pbs.twimg.com/profile_images/1399287867965272064/wTZprrCx_400x400.jpg"
            },
            {
                "id": 1,
                "display_name": "Fastriver",
                "user_id": "Fastriver_org",
                "notifications": [],
                "image_url": "https://pbs.twimg.com/profile_images/3441612194/6e4db404420235cc8d225d79c6073cc0_400x400.jpeg"
            }
        ],
        "leader": {
            "id": 1,
            "display_name": "Fastriver",
            "user_id": "Fastriver_org",
            "notifications": [],
            "image_url": "https://pbs.twimg.com/profile_images/3441612194/6e4db404420235cc8d225d79c6073cc0_400x400.jpeg"
        }
    },
    {
        "id": 1,
        "name": "AI班",
        "members": [
            {
                "id": 2,
                "display_name": "Besshy",
                "user_id": "besshy8",
                "notifications": [],
                "image_url": "https://pbs.twimg.com/profile_images/3441612194/6e4db404420235cc8d225d79c6073cc0_400x400.jpeg"
            }
        ],
        "leader": {
            "id": 2,
            "display_name": "Besshy",
            "user_id": "besshy8",
            "notifications": [],
            "image_url": "https://pbs.twimg.com/profile_images/3441612194/6e4db404420235cc8d225d79c6073cc0_400x400.jpeg"
        }
    },
    {
        "id": 2,
        "name": "Game班",
        "members": [
            {
                "id": 3,
                "display_name": "国民所得倍増計画",
                "user_id": "imcometwotimes",
                "notifications": [],
                "image_url": "https://pbs.twimg.com/profile_images/3441612194/6e4db404420235cc8d225d79c6073cc0_400x400.jpeg"
            }
        ],
        "leader": {
            "id": 3,
            "display_name": "国民所得倍増計画",
            "user_id": "imcometwotimes",
            "notifications": [],
            "image_url": "https://pbs.twimg.com/profile_images/3441612194/6e4db404420235cc8d225d79c6073cc0_400x400.jpeg"
        }
    }
]
"""
    
    private static let eventsRawData = """
[
    {
        "id": 0,
        "name": "Web班勉強会",
        "start_at": "2021-12-19T22:00:00+09:00",
        "end_at": "2021-12-19T23:00:00+09:00",
        "interested": [
            {
                "id": 0,
                "display_name": "ふみっち",
                "user_id": "fummicc1",
                "notifications": [],
                "image_url": "https://pbs.twimg.com/profile_images/1399287867965272064/wTZprrCx_400x400.jpg"
            },
            {
                "id": 1,
                "display_name": "Fastriver",
                "user_id": "Fastriver_org",
                "notifications": [],
                "image_url": "https://pbs.twimg.com/profile_images/3441612194/6e4db404420235cc8d225d79c6073cc0_400x400.jpeg"
            }
        ],
        "repeat_type": "everyWeek"
    },
    {
        "id": 1,
        "name": "AI班勉強会",
        "start_at": "2021-12-22T21:00:00+09:00",
        "end_at": "2021-12-22T22:00:00+09:00",
        "interested": [
            {
                "id": 2,
                "display_name": "Besshy",
                "user_id": "besshy8",
                "notifications": [],
                "image_url": "https://pbs.twimg.com/profile_images/3441612194/6e4db404420235cc8d225d79c6073cc0_400x400.jpeg"
            }
        ],
        "repeat_type": "everyWeek"
    },
    {
        "id": 2,
        "name": "Game班勉強会",
        "start_at": "2021-12-19T21:00:00+09:00",
        "end_at": "2021-12-19T22:00:00+09:00",
        "interested": [
            {
                "id": 3,
                "display_name": "国民所得倍増計画",
                "user_id": "imcometwotimes",
                "notifications": [],
                "image_url": "https://pbs.twimg.com/profile_images/3441612194/6e4db404420235cc8d225d79c6073cc0_400x400.jpeg"
            },
            {
                "id": 0,
                "display_name": "ふみっち",
                "user_id": "fummicc1",
                "notifications": [],
                "image_url": "https://pbs.twimg.com/profile_images/1399287867965272064/wTZprrCx_400x400.jpg"
            }
        ],
        "repeat_type": "everyWeek"
    }
]
"""
    
    static public let defaultMembers: [Member] = {
        let data = membersRawData.data(using: .utf8)!
        let members = try! decoder.decode([Member].self, from: data)
        return members
    }()
    
    static public let defaultTeams: [Team] = {
        let data = teamsRawData.data(using: .utf8)!
        let teams = try! decoder.decode([Team].self, from: data)
        return teams
    }()
    
    static public let defaultEvents: [Event] = {
        let data = eventsRawData.data(using: .utf8)!
        let events = try! decoder.decode([Event].self, from: data)
        return events
    }()
}
