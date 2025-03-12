// Copyright © StreamMotion. All rights reserved.

import Foundation

import Domain
import Utils

public struct SMApiClient {
    
    // MARK: - Properties

    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    // MARK: - Init

    public init() {}
}

// MARK: - ApiClient

extension SMApiClient: ApiClient {
    
    public func fetch<T>(route: Route, as: T.Type) async throws -> T where T : Decodable {
        guard let url = URL(string: Constants.baseUrl + route.path) else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = route.httpMethod.rawValue
        
        let (data, _) = try await session.data(for: request)
        return try decoder.decode(T.self, from: data)
    }

}
