// Copyright © StreamMotion. All rights reserved.

import Foundation

public protocol FetchVideosUseCase: Sendable {
    func execute(page: Int) async throws -> VideoResponse
}
