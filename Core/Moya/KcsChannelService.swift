import Foundation
import Moya

public enum KcsChannelService {
    case getChannelInfo
    case getPlaylists(String)
    case getPlaylistItems(String)
    case getVideo(String)
}

extension KcsChannelService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://www.googleapis.com/youtube/v3/")!
    }

    public var path: String {
        switch self {
        case .getChannelInfo:
            return "/channels"
        case .getPlaylists:
            return "/playlists"
        case .getPlaylistItems:
            return "/playlistItems"
        case .getVideo:
            return "/videos"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .getChannelInfo, .getPlaylistItems, .getPlaylists, .getVideo:
            return .get
        }
    }

    public var task: Task {
        var parameters: [String: Any] = [
            "key": Constants.youtubeApiKey
        ]
        switch self {
        case .getChannelInfo:
            parameters["forUsername"] = "kcs1959"
            parameters["part"] = "snippet,contentDetails"
        case .getPlaylists(let channelId):
            parameters["part"] = "id,snippet,status"
            parameters["channelId"] = channelId
        case .getPlaylistItems:
            break
        case .getVideo:
            break
        }
        return Task.requestParameters(
            parameters: parameters,
            encoding: URLEncoding.default
        )
    }

    public var headers: [String : String]? {
        nil
    }

    
}
