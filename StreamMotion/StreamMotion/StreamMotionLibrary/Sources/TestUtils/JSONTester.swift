// Copyright © StreamMotion. All rights reserved.

import Foundation
import XCTest

import Utils

private enum JSONTesterError: Error {
    case failedData
}

public class JSONTester {

    private static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        return jsonDecoder
    }()

    public static func parse<ObjectType: Decodable>(as type: ObjectType.Type, json: String) throws -> ObjectType {
        guard let data = json.data(using: .utf8) else {
            XCTFail("Failed to get data from JSON named \(json).")
            throw JSONTesterError.failedData
        }

        do {
            let object = try jsonDecoder.decode(ObjectType.self, from: data)
            return object
        } catch {
            XCTFail("Failed to parse JSON as \(String(describing: ObjectType.self)). Error: \(error)")
            throw error
        }
    }

    public static func expectToNotParse<ObjectType>(as type: ObjectType.Type, json: String) where ObjectType: Decodable {
        guard let data = json.data(using: .utf8) else {
            XCTFail("Failed to get data from JSON named \(json).")
            return
        }

        do {
            _ = try jsonDecoder.decode(ObjectType.self, from: data)
            XCTFail("Parsed JSON as \(String(describing: ObjectType.self)) when it should have failed.")
        } catch {
            XCTAssertTrue(true)
        }
    }
}
