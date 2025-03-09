//
//  SMFetchVideosUseCase.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import Foundation

import Domain

public struct SMFetchVideosUseCase: FetchVideosUseCase {
    
    private let repository: VideoRepository

    public init(repository: VideoRepository = SMVideoRepository()) {
        self.repository = repository
    }

    public func execute(page: Int) async throws -> VideoResponse {
        return try await repository.getVideos(page: page)
    }
}
