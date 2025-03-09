//
//  VideoPlayerView.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import SwiftUI
import AVKit

import Utils

public struct VideoPlayerView: View {

    public init() {}
    
    public var body: some View {
        VideoPlayer(player: AVPlayer(url: Constants.videoUrl))
            .edgesIgnoringSafeArea(.all)
    }
}
