// Copyright © StreamMotion. All rights reserved.

import Foundation

public enum Route {
    
    public enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    case video(page: Int)
    
    public var httpMethod: HttpMethod {
        switch self {
            case .video: .get
        }
    }
    
    public var path: String {
        switch self {
            case .video(let page):
                "videos?fields=id,title,description,thumbnail_url,created_time&page=\(page)"
        }
    }
}
