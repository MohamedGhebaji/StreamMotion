//
//  DateClient.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import Foundation

public protocol DateClient: Sendable {
    func now() -> TimeInterval
}
