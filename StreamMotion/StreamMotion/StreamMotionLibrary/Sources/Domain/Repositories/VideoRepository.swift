//
//  VideoRepository.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import Foundation

public protocol VideoRepository: Sendable {
    func getVideos(page: Int) async throws -> VideoResponse
}
