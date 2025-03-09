//
//  File.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 09/03/2025.
//

import Foundation

import Domain

public extension Video {
    
    struct Samples {

        public static var dummy: Video {
            with()
        }
        
        public static func with(
            id: String = "id",
            title: String = "title",
            description: String = "description",
            thumbnailUrl: String = "http://example.com",
            creationTime: TimeInterval = 1711900200
        ) -> Video {
            Video(
                id: id,
                title: title,
                description: description,
                thumbnailUrl: thumbnailUrl,
                creationTime: creationTime
            )
        }
    }
}
