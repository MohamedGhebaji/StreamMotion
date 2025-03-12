// Copyright © StreamMotion. All rights reserved.

import Foundation

public protocol DateClient: Sendable {
    func now() -> TimeInterval
}
