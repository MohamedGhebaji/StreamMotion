// Copyright © StreamMotion. All rights reserved.

import SwiftUI
import AVKit

import Utils
import Router

public struct VideoPlayerView: View {
    
    @StateObject private var viewModel: VideoPlayerViewModel
    @EnvironmentObject private var routeurPath: RouterPath
    
    public init(viewModel: VideoPlayerViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VideoPlayer(player: viewModel.getPlayer())
            .edgesIgnoringSafeArea(.all)
            .overlay(alignment: .topTrailing) {
                Button(action: {
                    routeurPath.presentedSheet = nil
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                }
            }
            .task {
                viewModel.play()
            }
    }
}
