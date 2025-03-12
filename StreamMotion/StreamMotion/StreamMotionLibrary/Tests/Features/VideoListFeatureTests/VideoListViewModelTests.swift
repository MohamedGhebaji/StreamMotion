// Copyright © StreamMotion. All rights reserved.

import XCTest

@testable import VideoListFeature
import Domain
import TestUtils

@MainActor
final class VideoListViewModelTests: XCTestCase {
    
    func testFetchVideos_success() async {
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
        let expectations: [VideoRowState] = [
            .init(id: "1", thumbnailUrl: "https://test.com/image.jpg", title: "Test Video", description: "Test Description".toAttributedStringFromHTML(), timeAgo: "Il y a 5 minutes"),
            .init(id: "2", thumbnailUrl: "https://test.com/image2.jpg", title: "Second Video", description: "Another Description".toAttributedStringFromHTML(), timeAgo: "Il y a 5 minutes")
        ]
        XCTAssertEqual(viewModel.videoListState, .success(expectations))
        XCTAssertTrue(viewModel.canLoadMore)
    }
    
    func testFetchVideos_failure() async {
        // GIVEN
        let fetchVideosMock = FetchVideosUseCaseMock(stubType: .failure(URLError(.notConnectedToInternet)))
        let minutesAgoMock = MinutesAgoUseCaseMock(expectation: 5)
        
        let viewModel = VideoListViewModel(fetchVideosUseCase: fetchVideosMock, minutesAgoUseCase: minutesAgoMock)
        
        // WHEN
        await viewModel.fetchVideos()
        
        // THEN
        XCTAssertEqual(viewModel.videoListState, .failure)
        XCTAssertFalse(viewModel.canLoadMore)
    }
    
    func testPagination_success() async {
        // GIVEN
        let mockVideosPage1 = [
            Video(id: "1", title: "Video 1", description: "Desc 1", thumbnailUrl: "https://test.com/image.jpg", creationTime: 1711900200)
        ]
        let mockVideosPage2 = [
            Video(id: "2", title: "Video 2", description: "Desc 2", thumbnailUrl: "https://test.com/image2.jpg", creationTime: 1711900300)
        ]
        
        let fetchVideosMockPage1 = FetchVideosUseCaseMock(stubType: .success(VideoResponse(list: mockVideosPage1, hasMore: true, page: 1)))
        let fetchVideosMockPage2 = FetchVideosUseCaseMock(stubType: .success(VideoResponse(list: mockVideosPage2, hasMore: false, page: 2)))
        
        let minutesAgoMock = MinutesAgoUseCaseMock(expectation: 5)
        
        let viewModel = VideoListViewModel(fetchVideosUseCase: fetchVideosMockPage1, minutesAgoUseCase: minutesAgoMock)
        
        // WHEN
        let expectationsPage1: [VideoRowState] = [
            .init(id: "1", thumbnailUrl: "https://test.com/image.jpg", title: "Video 1", description: "Desc 1".toAttributedStringFromHTML(), timeAgo: "Il y a 5 minutes")
        ]
        await viewModel.fetchVideos()
        XCTAssertEqual(viewModel.videoListState, .success(expectationsPage1))
        XCTAssertTrue(viewModel.canLoadMore)
        
        // WHEN
        viewModel.fetchVideosUseCase = fetchVideosMockPage2
        await viewModel.loadNextPage()
        
        // THEN
        let expectationsPage2: [VideoRowState] = [
            .init(id: "1", thumbnailUrl: "https://test.com/image.jpg", title: "Video 1", description: "Desc 1".toAttributedStringFromHTML(), timeAgo: "Il y a 5 minutes"),
            .init(id: "2", thumbnailUrl: "https://test.com/image2.jpg", title: "Video 2", description: "Desc 2".toAttributedStringFromHTML(), timeAgo: "Il y a 5 minutes"),
        ]
        XCTAssertEqual(viewModel.videoListState, .success(expectationsPage2))
        XCTAssertFalse(viewModel.canLoadMore)
    }
    
    func testPagination_failure() async {
        // GIVEN
        let fetchVideosMock = FetchVideosUseCaseMock(stubType: .failure(URLError(.timedOut)))
        let minutesAgoMock = MinutesAgoUseCaseMock(expectation: 5)
        
        let viewModel = VideoListViewModel(fetchVideosUseCase: fetchVideosMock, minutesAgoUseCase: minutesAgoMock)
        viewModel.canLoadMore = true
        
        // WHEN
        await viewModel.loadNextPage()
        
        // THEN
        XCTAssertEqual(viewModel.videoListState, .failure)
        XCTAssertTrue(viewModel.canLoadMore)
    }
}
