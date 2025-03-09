//
//  VideoListViewModelTests.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 09/03/2025.
//

import XCTest

@testable import VideoListFeature
import Domain
import TestUtils

@MainActor
final class VideoListViewModelTests: XCTestCase {
    
    func testFetchVideos_Success() async {
        // GIVEN
        let mockVideos = [
            Video(id: "1", title: "Test Video", description: "Test Description", thumbnailUrl: "https://test.com/image.jpg", creationTime: 1711900200),
            Video(id: "2", title: "Second Video", description: "Another Description", thumbnailUrl: "https://test.com/image2.jpg", creationTime: 1711900300)
        ]
        
        let mockResponse = VideoResponse(list: mockVideos, hasMore: true, page: 1)
        let fetchVideosMock = FetchVideosUseCaseMock(stubType: .success(mockResponse))
        let minutesAgoMock = MinutesAgoUseCaseMock(expectation: 5)
        
        let viewModel = VideoListViewModel(fetchVideosUseCase: fetchVideosMock, minutesAgoUseCase: minutesAgoMock)
        
        // WHEN
        await viewModel.fetchVideos()
        
        // THEN
        XCTAssertFalse(viewModel.rows.isEmpty)
        XCTAssertEqual(viewModel.rows.count, mockVideos.count)
        XCTAssertEqual(viewModel.rows[0].title, "Test Video")
        XCTAssertEqual(viewModel.rows[0].description, "Test Description")
        XCTAssertEqual(viewModel.rows[0].thumbnailUrl, "https://test.com/image.jpg")
        XCTAssertEqual(viewModel.rows[0].timeAgo, "Il y a 5 minutes")
        XCTAssertEqual(viewModel.rows[1].title, "Second Video")
        XCTAssertEqual(viewModel.rows[1].description, "Another Description")
        XCTAssertEqual(viewModel.rows[1].thumbnailUrl, "https://test.com/image2.jpg")
        XCTAssertEqual(viewModel.rows[1].timeAgo, "Il y a 5 minutes")
        XCTAssertTrue(viewModel.canLoadMore)
        XCTAssertFalse(viewModel.isFailed)
    }
    
    func testFetchVideos_Failure() async {
        // GIVEN
        let fetchVideosMock = FetchVideosUseCaseMock(stubType: .failure(URLError(.notConnectedToInternet)))
        let minutesAgoMock = MinutesAgoUseCaseMock(expectation: 5)
        
        let viewModel = VideoListViewModel(fetchVideosUseCase: fetchVideosMock, minutesAgoUseCase: minutesAgoMock)
        
        // WHEN
        await viewModel.fetchVideos()
        
        // THEN
        XCTAssertTrue(viewModel.rows.isEmpty)
        XCTAssertFalse(viewModel.canLoadMore)
        XCTAssertTrue(viewModel.isFailed)
    }
    
    func testPagination_Success() async {
        // GIVEN
        let mockVideosPage1 = [
            Video(id: "1", title: "Video 1", description: "Desc 1", thumbnailUrl: "url1", creationTime: 1711900200)
        ]
        let mockVideosPage2 = [
            Video(id: "2", title: "Video 2", description: "Desc 2", thumbnailUrl: "url2", creationTime: 1711900300)
        ]
        
        let fetchVideosMockPage1 = FetchVideosUseCaseMock(stubType: .success(VideoResponse(list: mockVideosPage1, hasMore: true, page: 1)))
        let fetchVideosMockPage2 = FetchVideosUseCaseMock(stubType: .success(VideoResponse(list: mockVideosPage2, hasMore: false, page: 2)))
        
        let minutesAgoMock = MinutesAgoUseCaseMock(expectation: 5)
        
        let viewModel = VideoListViewModel(fetchVideosUseCase: fetchVideosMockPage1, minutesAgoUseCase: minutesAgoMock)
        
        // WHEN
        await viewModel.fetchVideos()
        XCTAssertEqual(viewModel.rows.count, 1)
        XCTAssertTrue(viewModel.canLoadMore)
        XCTAssertFalse(viewModel.isFailed)
        
        // WHEN
        viewModel.fetchVideosUseCase = fetchVideosMockPage2
        await viewModel.loadNextPage()
        
        // THEN
        XCTAssertEqual(viewModel.rows.count, 2)
        XCTAssertFalse(viewModel.canLoadMore)
        XCTAssertFalse(viewModel.isFailed)
    }
    
    func testPagination_Failure() async {
        // GIVEN
        let fetchVideosMock = FetchVideosUseCaseMock(stubType: .failure(URLError(.timedOut)))
        let minutesAgoMock = MinutesAgoUseCaseMock(expectation: 5)
        
        let viewModel = VideoListViewModel(fetchVideosUseCase: fetchVideosMock, minutesAgoUseCase: minutesAgoMock)
        viewModel.canLoadMore = true
        
        // WHEN
        await viewModel.loadNextPage()
        
        // THEN
        XCTAssertTrue(viewModel.rows.isEmpty)
        XCTAssertFalse(viewModel.canLoadMore)
        XCTAssertTrue(viewModel.isFailed)
    }
}
