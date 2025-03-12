// Copyright © StreamMotion. All rights reserved.

import Foundation

import Domain

public struct SMFetchVideosUseCase {
    
    // MARK: - Properties
    
    private let repository: VideoRepository

    // MARK: - Init
    
    public init(repository: VideoRepository = SMVideoRepository()) {
        self.repository = repository
    }
}

// MARK: - FetchVideosUseCase

extension SMFetchVideosUseCase: FetchVideosUseCase {
    
    public func execute(page: Int) async throws -> VideoResponse {
        return try await repository.getVideos(page: page)
    }
}
