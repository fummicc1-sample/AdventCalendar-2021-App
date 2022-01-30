//
//  KcsChannelService.swift
//  
//
//  Created by Fumiya Tanaka on 2022/01/30.
//

import Foundation
import Moya

public enum KcsChannelService {
    case getChannelInfo
}

extension KcsChannelService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://www.googleapis.com/youtube/v3/")!
    }

    public var path: String {
        switch self {
        case .getChannelInfo:
            return "/channels"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .getChannelInfo:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case .getChannelInfo:
            return Task.requestParameters(
                parameters: [
                    "key": youtubeApiKey,
                    "part": "id,snippet,contentDetails",
                    "forUserName": "kcs1959"
                ],
                encoding: URLEncoding.default
            )
        }
    }

    public var headers: [String : String]? {
        nil
    }

    
}
