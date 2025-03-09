//
//  File.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 09/03/2025.
//

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
