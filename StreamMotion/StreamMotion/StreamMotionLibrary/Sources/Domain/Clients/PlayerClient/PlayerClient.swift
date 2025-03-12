// Copyright © StreamMotion. All rights reserved.

import Foundation

import AVKit

public protocol PlayerClient {
    
    func getPlayer() -> AVPlayer
    func play(url: URL)
}
