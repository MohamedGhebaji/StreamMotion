// Copyright © StreamMotion. All rights reserved.

import Foundation

import Domain
import Utils

@MainActor
public class VideoListViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var videoListState: ViewState<[VideoRowState]> = .loading
    @Published var canLoadMore = false
    
    // MARK: - Private Properties
    
    var fetchVideosUseCase: FetchVideosUseCase
    private let minutesAgoUseCase: MinutesAgoUseCase
    private var currentPage: Int = 0
    
    // MARK: - Init

    public init(fetchVideosUseCase: FetchVideosUseCase, minutesAgoUseCase: MinutesAgoUseCase) {
        self.fetchVideosUseCase = fetchVideosUseCase
        self.minutesAgoUseCase = minutesAgoUseCase
    }
    
    func fetchVideos() async {
        do {
            let response = try await fetchVideosUseCase.execute(page: currentPage + 1)
            let videoRowStates = response.list.map {
                VideoRowState(
                    id: $0.id,
                    thumbnailUrl: $0.thumbnailUrl,
                    title: $0.title,
                    description: $0.description.toAttributedStringFromHTML(),
                    timeAgo: "Il y a \(minutesAgoUseCase.execute(from: $0.creationTime)) minutes"
                )
            }
            switch videoListState {
                case .success(var rows):
                    rows.append(contentsOf: videoRowStates)
                    videoListState = .success(rows)
                default:
                    videoListState = .success(videoRowStates)
            }
            currentPage = response.page
            canLoadMore = response.hasMore
        } catch {
            if videoListState == .loading {
                videoListState = .failure
            }
        }
    }
    
    @MainActor
    func loadNextPage() async {
        guard canLoadMore else { return }
        await fetchVideos()
    }
}
