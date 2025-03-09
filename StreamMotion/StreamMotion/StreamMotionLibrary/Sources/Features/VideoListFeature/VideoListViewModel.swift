//
//  VideoListViewModel.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import Foundation

import Domain

@MainActor
public class VideoListViewModel: ObservableObject {
    
    enum State: Equatable {
        case loading
        case success([VideoRowState])
        case failure
    }
    // MARK: - Public Properties
    
    @Published var state: State = .loading
    @Published var canLoadMore = false
    
    // MARK: - Private Properties
    
    var fetchVideosUseCase: FetchVideosUseCase
    private let minutesAgoUseCase: MinutesAgoUseCase
    private var currentPage: Int = 0
    private var rows = [VideoRowState]()
    
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
                    description: $0.description,
                    timeAgo: "Il y a \(minutesAgoUseCase.execute(from: $0.creationTime)) minutes"
                )
            }
            rows.append(contentsOf: videoRowStates)
            state = .success(rows)
            currentPage = response.page
            canLoadMore = response.hasMore
        } catch {
            if rows.isEmpty {
                state = .failure
            }
        }
    }
    
    @MainActor
    func loadNextPage() async {
        guard canLoadMore else { return }
        await fetchVideos()
    }
}
