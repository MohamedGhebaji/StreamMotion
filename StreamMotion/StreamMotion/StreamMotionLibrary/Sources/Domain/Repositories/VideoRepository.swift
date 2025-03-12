// Copyright © StreamMotion. All rights reserved.

import Foundation

public protocol VideoRepository: Sendable {
    func getVideos(page: Int) async throws -> VideoResponse
}
