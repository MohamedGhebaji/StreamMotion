//
//  VideoTests.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 09/03/2025.
//

import XCTest

@testable import Domain
import TestUtils

final class VideoTests: XCTestCase {
    
    func testVideo_shouldParse_whenAllFieldArePresent() {
        let tested = try? JSONTester.parse(
            as: Video.self,
            json: """
            {
                "id": "x9fu42i",
                "title": "Marry the Right Man",
                "description": "Marry the Right Man  <br /> #EnglishMovie #cdrama #drama #engsub #chinesedramaengsub #movieshortfull",
                "thumbnail_url": "https://s2.dmcdn.net/v/Y1QCQ1dpSjHilFyDD",
                "created_time": 1741540001
            }
            """
        )
        let expectation = Video(id: "x9fu42i", title: "Marry the Right Man", description: "Marry the Right Man  <br /> #EnglishMovie #cdrama #drama #engsub #chinesedramaengsub #movieshortfull", thumbnailUrl: "https://s2.dmcdn.net/v/Y1QCQ1dpSjHilFyDD", creationTime: 1741540001)
        XCTAssertEqual(tested, expectation)
    }
    
    func testVideo_shouldNotParse_whenFieldIdIsMissing() {
        JSONTester.expectToNotParse(
            as: VideoResponse.self,
            json: """
            {
                "title": "Marry the Right Man",
                "description": "Marry the Right Man  <br /> #EnglishMovie #cdrama #drama #engsub #chinesedramaengsub #movieshortfull",
                "thumbnail_url": "https://s2.dmcdn.net/v/Y1QCQ1dpSjHilFyDD",
                "created_time": 1741540001
            }
            """
        )
    }
    
    func testVideo_shouldNotParse_whenFieldTitleIsMissing() {
        JSONTester.expectToNotParse(
            as: VideoResponse.self,
            json: """
            {
                "id": "x9fu42i",
                "description": "Marry the Right Man  <br /> #EnglishMovie #cdrama #drama #engsub #chinesedramaengsub #movieshortfull",
                "thumbnail_url": "https://s2.dmcdn.net/v/Y1QCQ1dpSjHilFyDD",
                "created_time": 1741540001
            }
            """
        )
    }
    
    func testVideoResponse_shouldNotParse_whenFieldDescriptionMissing() {
        JSONTester.expectToNotParse(
            as: VideoResponse.self,
            json: """
            {
                "id": "x9fu42i",
                "title": "Marry the Right Man",
                "thumbnail_url": "https://s2.dmcdn.net/v/Y1QCQ1dpSjHilFyDD",
                "created_time": 1741540001
            }
            """
        )
    }
    
    func testVideoResponse_shouldNotParse_whenFieldThumbnailUrlMissing() {
        JSONTester.expectToNotParse(
            as: VideoResponse.self,
            json: """
            {
                "id": "x9fu42i",
                "title": "Marry the Right Man",
                "description": "Marry the Right Man  <br /> #EnglishMovie #cdrama #drama #engsub #chinesedramaengsub #movieshortfull",
                "created_time": 1741540001
            }
            """
        )
    }
    
    func testVideoResponse_shouldNotParse_whenFieldCreatedTimeMissing() {
        JSONTester.expectToNotParse(
            as: VideoResponse.self,
            json: """
            {
                "id": "x9fu42i",
                "title": "Marry the Right Man",
                "description": "Marry the Right Man  <br /> #EnglishMovie #cdrama #drama #engsub #chinesedramaengsub #movieshortfull",
                "thumbnail_url": "https://s2.dmcdn.net/v/Y1QCQ1dpSjHilFyDD",
            }
            """
        )
    }
}

