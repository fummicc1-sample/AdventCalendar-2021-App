import SwiftUI

let membersData = """
[
    {
        "id": 0,
        "display_name": "ふみっち",
        "user_id": "fummicc1",
        "notifications": []
    },
    {
        "id": 1,
        "display_name": "Fastriver",
        "user_id": "Fastriver_org",
        "notifications": []
    },
    {
        "id": 2,
        "display_name": "Besshy",
        "user_id": "besshy8",
        "notifications": []
    },
    {
        "id": 3,
        "display_name": "国民所得倍増計画",
        "user_id": "imcometwotimes",
        "notifications": []
    }
]
"""

let teamsData = """
[
    {
        "id": 0,
        "name": "Web班",
        "members": [
            {
                "id": 0,
                "display_name": "ふみっち",
                "user_id": "fummicc1",
                "notifications": []
            },
            {
                "id": 1,
                "display_name": "Fastriver",
                "user_id": "Fastriver_org",
                "notifications": []    
            }
        ],
        "leader": {
            "id": 1,
            "display_name": "Fastriver",
            "user_id": "Fastriver_org",
            "notifications": []
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
                "notifications": []
            },
        ],
        "leader": {
            "id": 2,
            "display_name": "Besshy",
            "user_id": "besshy8",
            "notifications": []
        },
    },
    {
        "id": 2,
        "name": "Game班",
        "members": [
            {
                "id": 3,
                "display_name": "国民所得倍増計画",
                "user_id": "imcometwotimes",
                "notifications": []
            }
        ],
        "leader": {
            "id": 3,
            "display_name": "国民所得倍増計画",
            "user_id": "imcometwotimes",
            "notifications": []
        }
    }
]
"""

let eventsData = """
[
    {
        "id": 0,
        "name": "Web班勉強会",
        "start_at": 2021-12-19T22:00:00.000+9:00
        "end_at": 2021-12-19T23:00:00.000+9:00,
        "description": "Web班の毎週の集まり",
        "interested": [
            {
                "display_name": "ふみっち",
                "user_id": "fummicc1",
                "notifications": []
            },
            {
                "display_name": "Fastriver",
                "user_id": "Fastriver_org",
                "notifications": []
            }
        ],
        "repeat_type": "everyWeek"
    },
    {
        "id": 1,
        "name": "AI班勉強会",
        "start_at": 2021-12-22T21:00:00.000+9:00
        "end_at": 2021-12-22T22:00:00.000+9:00,
        "interested": [
            {
                "display_name": "Besshy",
                "user_id": "besshy8",
                "notifications": []
            },
        ],
        "repeat_type": "everyWeek"
    },
    {
        "id": 2,
        "name": "Game班勉強会",
        "start_at": 2021-12-19T21:00:00.000+9:00
        "end_at": 2021-12-19T22:00:00.000+9:00,
        "interested": [
            {
                "display_name": "国民所得倍増計画",
                "user_id": "imcometwotimes",
                "notifications": []
            },
            {
                "display_name": "ふみっち",
                "user_id": "fummicc1",
                "notifications": []
            },
        ],
        "repeat_type": "everyWeek"
    }
]
"""
