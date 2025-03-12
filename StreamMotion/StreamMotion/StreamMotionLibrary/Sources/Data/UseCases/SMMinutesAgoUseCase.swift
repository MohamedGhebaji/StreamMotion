// Copyright © StreamMotion. All rights reserved.

import Foundation

import Domain

public struct SMMinutesAgoUseCase {
   
    // MARK: - Properties
    
    private let dateClient: DateClient

    // MARK: - Init
    
    public init(dateClient: DateClient = SMDateClient()) {
        self.dateClient = dateClient
    }
}

// MARK: - MinutesAgoUseCase

extension SMMinutesAgoUseCase: MinutesAgoUseCase {
    
    public func execute(from timestamp: TimeInterval) -> Int {
        let givenDate = Date(timeIntervalSince1970: timestamp)
        let now = Date(timeIntervalSince1970: dateClient.now())
        
        let difference = Calendar.current.dateComponents([.minute], from: givenDate, to: now)
        return difference.minute ?? 0
    }
}
