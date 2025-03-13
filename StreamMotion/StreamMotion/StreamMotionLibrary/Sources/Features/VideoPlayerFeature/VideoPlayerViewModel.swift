// Copyright © StreamMotion. All rights reserved.

import Foundation

import Domain
import AVKit

public class VideoPlayerViewModel: ObservableObject {
    
    // MARK: - Properties
    
    private let playerClient: PlayerClient
    private let url: URL
    
    // MARK: - Init
    
    public init(url: URL, playerClient: PlayerClient) {
        self.playerClient = playerClient
        self.url = url
    }
    
    // MARK: - Public functions
    
    func getPlayer() -> AVPlayer {
        playerClient.getPlayer()
    }
    
    func play() {
        playerClient.play(url: url)
    }
    
    func stop() {
        playerClient.stop()
    }
}
