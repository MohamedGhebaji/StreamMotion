// Copyright © StreamMotion. All rights reserved.

import Foundation

import Domain

public struct MinutesAgoUseCaseMock: MinutesAgoUseCase {
    
    private let expectation: Int
    public init(expectation: Int) {
        self.expectation = expectation
    }
    
    public func execute(from timestamp: TimeInterval) -> Int {
        expectation
    }
}
