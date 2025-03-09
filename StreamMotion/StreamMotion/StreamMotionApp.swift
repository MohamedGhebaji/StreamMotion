//
//  StreamMotionApp.swift
//  StreamMotion
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import SwiftUI

import Data
import VideoListFeature

@main
struct StreamMotionApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                VideoListView(
                    viewModel: .init(
                        fetchVideosUseCase: SMFetchVideosUseCase(),
                        minutesAgoUseCase: SMMinutesAgoUseCase()
                    )
                )
            }
        }
    }
}
