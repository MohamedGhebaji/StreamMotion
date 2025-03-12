// Copyright © StreamMotion. All rights reserved.

import SwiftUI

import Data
import VideoListFeature
import Router

@main
struct StreamMotionApp: App {
    
    // MARK: - Properties
    
    @ObservedObject private var routeurPath = RouterPath()

    // MARK: - Body

    var body: some Scene {
        WindowGroup {
            NavigationView {
                VideoListView(
                    viewModel: .init(
                        fetchVideosUseCase: SMFetchVideosUseCase(),
                        minutesAgoUseCase: SMMinutesAgoUseCase()
                    )
                )
                .withSheetDestinations(sheetDestinations: $routeurPath.presentedSheet)
                .environmentObject(routeurPath)
            }
        }
    }
}
