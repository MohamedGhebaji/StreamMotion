// Copyright © StreamMotion. All rights reserved.

import Foundation
import AVKit

import Domain

public struct SMPlayerClient {
    
    // MARK: - Properties
    
    private let player = AVPlayer()
    
    // MARK: - Init
    
    public init() {}
}

extension SMPlayerClient: PlayerClient {
    
    public func getPlayer() -> AVPlayer {
        player
    }
    
    public func play(url: URL) {
        let item = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: item)
        player.play()
    }
    
    public func stop() {
        player.pause()
    }
}
