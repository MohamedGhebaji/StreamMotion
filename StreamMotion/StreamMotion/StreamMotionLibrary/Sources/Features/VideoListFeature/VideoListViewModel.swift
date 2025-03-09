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
    
    // MARK: - Public Properties
    
    @Published var rows: [VideoRowState] = []
    @Published var canLoadMore = false

    // MARK: - Private Properties
    
    private let fetchVideosUseCase: FetchVideosUseCase
    private let minutesAgoUseCase: MinutesAgoUseCase
    private var isPaginating = false
    private var isLoading = false
    private var currentPage: Int = 0
    
    // MARK: - Init

    public init(fetchVideosUseCase: FetchVideosUseCase, minutesAgoUseCase: MinutesAgoUseCase) {
        self.fetchVideosUseCase = fetchVideosUseCase
        self.minutesAgoUseCase = minutesAgoUseCase
    }
    
    func fetchVideos() async {
        guard !isLoading else { return }
        isLoading = true

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
            currentPage = response.page
            canLoadMore = response.hasMore
        } catch {
            print("Error fetching videos: \(error)")
        }
        isLoading = false
    }
    
    @MainActor
    func loadNextPage() async {
        guard !isPaginating,
              canLoadMore
        else { return }
        
        isPaginating = true
        await fetchVideos()
        isPaginating = false
    }
}
