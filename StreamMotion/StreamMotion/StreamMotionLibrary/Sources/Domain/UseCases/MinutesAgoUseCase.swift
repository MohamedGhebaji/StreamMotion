//
//  MinutesAgoUseCase.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import Foundation

public protocol MinutesAgoUseCase: Sendable {
    func execute(from timestamp: TimeInterval) -> Int
}
