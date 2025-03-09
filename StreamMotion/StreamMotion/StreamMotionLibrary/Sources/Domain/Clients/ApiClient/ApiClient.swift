//
//  ApiClient.swift
//  iOS
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import Foundation

public protocol ApiClient: Sendable {
    func fetch<T: Decodable>(route: Route, as: T.Type) async throws -> T
}
