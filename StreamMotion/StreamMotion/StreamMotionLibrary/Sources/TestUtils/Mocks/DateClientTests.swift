// Copyright © StreamMotion. All rights reserved.

import Foundation

import Domain

public struct DateClientMock: DateClient {
    
    private let stub: TimeInterval
    
    public init(stub: TimeInterval) {
        self.stub = stub
    }
    
    public func now() -> TimeInterval {
        stub
    }
}
