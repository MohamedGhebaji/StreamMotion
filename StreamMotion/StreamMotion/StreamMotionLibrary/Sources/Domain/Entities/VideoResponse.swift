// Copyright © StreamMotion. All rights reserved.

import Foundation

public struct VideoResponse: Equatable, Decodable, Sendable {
    
    enum CodingKeys: String, CodingKey {
        case list, page
        case hasMore = "has_more"
    }
    
    public let list: [Video]
    public let hasMore: Bool
    public let page: Int
    
    public init(list: [Video], hasMore: Bool, page: Int) {
        self.list = list
        self.hasMore = hasMore
        self.page = page
    }
}
