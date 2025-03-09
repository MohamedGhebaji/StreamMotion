//
//  FetchVideosUseCase.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import Foundation

public protocol FetchVideosUseCase: Sendable {
    func execute(page: Int) async throws -> VideoResponse
}
