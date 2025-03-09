//
//  SMApiClient.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import Foundation

import Domain
import Utils

public struct SMApiClient: ApiClient {
    
    // MARK: - Properties

    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    // MARK: - Init

    public init() {}
    
    // MARK: - ApiClient
    
    public func fetch<T>(route: Route, as: T.Type) async throws -> T where T : Decodable {
        guard let url = URL(string: Constants.baseUrl + route.path) else {
            throw URLError(.badURL)
        }
        print("*** url : \(url)")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = route.httpMethod.rawValue
        
        let (data, _) = try await session.data(for: request)
        return try decoder.decode(T.self, from: data)
    }
}
