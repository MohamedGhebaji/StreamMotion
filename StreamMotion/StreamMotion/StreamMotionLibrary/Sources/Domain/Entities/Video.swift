//
//  Video.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import Foundation

public struct Video: Equatable, Identifiable, Decodable, Sendable {
    
    enum CodingKeys: String, CodingKey {
        case id, title, description
        case thumbnailUrl = "thumbnail_url"
        case creationTime = "created_time"
    }
    
    public let id: String
    public let title: String
    public let description: String
    public let thumbnailUrl: String
    public let creationTime: TimeInterval
    
    public init(
        id: String,
        title: String,
        description: String,
        thumbnailUrl: String,
        creationTime: TimeInterval
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.thumbnailUrl = thumbnailUrl
        self.creationTime = creationTime
    }
}
