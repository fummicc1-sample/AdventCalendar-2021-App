import SwiftUI

let membersData = """
[
    {
        "display_name": "ふみっち",
        "user_id": "fummicc1",
        "notifications": []
    },
    {
        "display_name": "Fastriver",
        "user_id": "Fastriver_org",
        "notifications": []
    },
    {
        "display_name": "Besshy",
        "user_id": "besshy8",
        "notifications": []
    },
    {
        "display_name": "国民所得倍増計画",
        "user_id": "imcometwotimes",
        "notifications": []
    }
]
"""

let teamsData = """
[
    {
        "name": "Web班",
        "members": [
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
        "leader": {
            "display_name": "Fastriver",
            "user_id": "Fastriver_org",
            "notifications": []
        }
    },
    {
        "name": "AI班",
        "members": [
            {
                "display_name": "Besshy",
                "user_id": "besshy8",
                "notifications": []
            },
        ],
        "leader": {
            "display_name": "Besshy",
            "user_id": "besshy8",
            "notifications": []
        },
    },
    {
        "name": "Game班",
        "members": [
            {
                "display_name": "国民所得倍増計画",
                "user_id": "imcometwotimes",
                "notifications": []
            }
        ],
        "leader": {
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
