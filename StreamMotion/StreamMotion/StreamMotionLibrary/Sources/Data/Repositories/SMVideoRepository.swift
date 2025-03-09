//
//  SMVideoRepository.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import Foundation

import Domain

public struct SMVideoRepository: VideoRepository {
    
    private let apiClient: ApiClient
    
    public init(apiClient: ApiClient = SMApiClient()) {
        self.apiClient = apiClient
    }
    
    public func getVideos(page: Int) async throws -> VideoResponse {
        return try await apiClient.fetch(route: .video(page: page), as: VideoResponse.self)
    }
}
