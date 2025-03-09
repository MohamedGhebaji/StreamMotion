//
//  SMMinutesAgoUseCase.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import Foundation

import Domain

public struct SMMinutesAgoUseCase: MinutesAgoUseCase {
   
    private let dateClient: DateClient

    public init(dateClient: DateClient = SMDateClient()) {
        self.dateClient = dateClient
    }
    
    public func execute(from timestamp: TimeInterval) -> Int {
        let givenDate = Date(timeIntervalSince1970: timestamp)
        let now = Date(timeIntervalSince1970: dateClient.now())
        
        let difference = Calendar.current.dateComponents([.minute], from: givenDate, to: now)
        return difference.minute ?? 0
    }
}
