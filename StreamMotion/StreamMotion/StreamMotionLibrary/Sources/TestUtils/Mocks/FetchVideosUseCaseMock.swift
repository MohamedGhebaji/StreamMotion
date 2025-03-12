// Copyright © StreamMotion. All rights reserved.

import Foundation

import Domain

public struct FetchVideosUseCaseMock: FetchVideosUseCase {
    
    public enum StubType: Sendable {
        case success(VideoResponse)
        case failure(Error)
    }
    
    private let stubType: StubType
    public init(stubType: StubType) {
        self.stubType = stubType
    }
    
    public func execute(page: Int) async throws -> VideoResponse {
        switch stubType {
            case .success(let response):
                return response
            case .failure(let error):
                throw error
        }
    }
}
