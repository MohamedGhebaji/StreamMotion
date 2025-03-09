//
//  DateClient.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 09/03/2025.
//

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
