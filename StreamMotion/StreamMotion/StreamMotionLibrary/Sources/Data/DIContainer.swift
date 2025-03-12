// Copyright © StreamMotion. All rights reserved.

import Foundation

import Domain

public class DIContainer {
    
    public static var shared = DIContainer()
    public let apiClient: ApiClient = SMApiClient()
    public let dateClient: DateClient = SMDateClient()
    public let playerClient: PlayerClient = SMPlayerClient()
}
