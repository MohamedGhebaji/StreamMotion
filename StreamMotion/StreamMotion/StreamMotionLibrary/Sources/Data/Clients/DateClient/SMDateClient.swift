// Copyright © StreamMotion. All rights reserved.

import Foundation

import Domain

public struct SMDateClient {
    
    // MARK: - Init
    
    public init() {}
}

// MARK: - DateClient

extension SMDateClient: DateClient {
    
    public func now() -> TimeInterval {
        Date().timeIntervalSince1970
    }
}
