//
//  VideoResponseTests.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 09/03/2025.
//

import XCTest

@testable import Domain
import TestUtils

final class VideoResponseTests: XCTestCase {
    
    func testVideoResponse_shouldParse_whenAllFieldArePresent() {
        let tested = try? JSONTester.parse(
            as: VideoResponse.self,
            json: """
            {
                "page": 1,
                "has_more": true,
                "list": [
                    {
                        "id": "x9fu42i",
                        "title": "Marry the Right Man",
                        "description": "Marry the Right Man  <br /> #EnglishMovie #cdrama #drama #engsub #chinesedramaengsub #movieshortfull",
                        "thumbnail_url": "https://s2.dmcdn.net/v/Y1QCQ1dpSjHilFyDD",
                        "created_time": 1741540001
                    }
                ]
            }
            """
        )
        let expectation = VideoResponse(list: [.init(id: "x9fu42i", title: "Marry the Right Man", description: "Marry the Right Man  <br /> #EnglishMovie #cdrama #drama #engsub #chinesedramaengsub #movieshortfull", thumbnailUrl: "https://s2.dmcdn.net/v/Y1QCQ1dpSjHilFyDD", creationTime: 1741540001)], hasMore: true, page: 1)
        XCTAssertEqual(tested, expectation)
    }
    
    func testVideoResponse_shouldNotParse_whenFieldPageIsMissing() {
        JSONTester.expectToNotParse(
            as: VideoResponse.self,
            json: """
            {
                "has_more": true,
                "list": [
                    {
                        "id": "x9fu42i",
                        "title": "Marry the Right Man",
                        "description": "Marry the Right Man  <br /> #EnglishMovie #cdrama #drama #engsub #chinesedramaengsub #movieshortfull",
                        "thumbnail_url": "https://s2.dmcdn.net/v/Y1QCQ1dpSjHilFyDD",
                        "created_time": 1741540001
                    }
                ]
            }
            """
        )
    }
    
    func testVideoResponse_shouldNotParse_whenFieldHasMoreIsMissing() {
        JSONTester.expectToNotParse(
            as: VideoResponse.self,
            json: """
            {
                "page": 1,
                "list": [
                    {
                        "id": "x9fu42i",
                        "title": "Marry the Right Man",
                        "description": "Marry the Right Man  <br /> #EnglishMovie #cdrama #drama #engsub #chinesedramaengsub #movieshortfull",
                        "thumbnail_url": "https://s2.dmcdn.net/v/Y1QCQ1dpSjHilFyDD",
                        "created_time": 1741540001
                    }
                ]
            }
            """
        )
    }
    
    func testVideoResponse_shouldNotParse_whenFieldListMissing() {
        JSONTester.expectToNotParse(
            as: VideoResponse.self,
            json: """
            {
                "page": 1,
                "has_more": true,
            }
            """
        )
    }
}
