// Copyright © StreamMotion. All rights reserved.

import SwiftUI

import Router
import VideoPlayerFeature
import Utils
import Data

extension View {
    
    func withSheetDestinations(sheetDestinations: Binding<SheetDestinations?>) -> some View {
        self.fullScreenCover(item: sheetDestinations) { destination in
            switch destination {
                case .player:
                    VideoPlayerView(
                        viewModel: VideoPlayerViewModel(
                            url: Constants.videoUrl,
                            playerClient: DIContainer.shared.playerClient
                        )
                    )
            }
        }
    }
}
