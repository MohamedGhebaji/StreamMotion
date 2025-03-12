// Copyright © StreamMotion. All rights reserved.

import SwiftUI

public final class RouterPath: ObservableObject {
    
    @Published public var path: [RouteurDestinations] = []
    @Published public var presentedSheet: SheetDestinations?
    
    public init() {}
        
    public func navigate(to: RouteurDestinations) {
      path.append(to)
    }
}

public enum RouteurDestinations: Hashable {
    case videoDetails(videoId: UUID)
}

public enum SheetDestinations: String, Identifiable {
    case player
    
    public var id: String {
        rawValue
    }
}
