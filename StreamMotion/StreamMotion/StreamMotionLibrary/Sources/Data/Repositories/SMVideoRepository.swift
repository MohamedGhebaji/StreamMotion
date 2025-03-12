// Copyright © StreamMotion. All rights reserved.

import Foundation

import Domain

public struct SMVideoRepository {
    
    // MARK: - Properties
    
    private let apiClient: ApiClient
    
    // MARK: - Init
    
    public init(apiClient: ApiClient = SMApiClient()) {
        self.apiClient = apiClient
    }
}

// MARK: - VideoRepository

extension SMVideoRepository: VideoRepository {
    
    public func getVideos(page: Int) async throws -> VideoResponse {
        return try await apiClient.fetch(route: .video(page: page), as: VideoResponse.self)
    }
}
