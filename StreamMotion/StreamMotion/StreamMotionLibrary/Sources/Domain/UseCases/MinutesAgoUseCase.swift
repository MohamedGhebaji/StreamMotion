// Copyright © StreamMotion. All rights reserved.

import Foundation

public protocol MinutesAgoUseCase: Sendable {
    func execute(from timestamp: TimeInterval) -> Int
}
