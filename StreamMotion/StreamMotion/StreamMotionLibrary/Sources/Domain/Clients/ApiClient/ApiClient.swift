// Copyright © StreamMotion. All rights reserved.

import Foundation

public protocol ApiClient: Sendable {
    func fetch<T: Decodable>(route: Route, as: T.Type) async throws -> T
}
