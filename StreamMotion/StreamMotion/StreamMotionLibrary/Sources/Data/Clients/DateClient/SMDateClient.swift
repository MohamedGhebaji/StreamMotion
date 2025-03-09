//
//  SMDateClient.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import Foundation

import Domain

public struct SMDateClient: DateClient {
    
    public init() {}
    
    public func now() -> TimeInterval {
        Date().timeIntervalSince1970
    }
}
