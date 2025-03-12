// Copyright © StreamMotion. All rights reserved.

import XCTest

@testable import Data
import TestUtils

final class SMMinutesAgoUseCaseTests: XCTestCase {
    
    func testExecute_shouldReturnMinutesAgo() {
        let dateClientMock = DateClientMock(stub: 1741554924)
        let tested = SMMinutesAgoUseCase(dateClient: dateClientMock)
        
        let result = tested.execute(from: 1741550423)
        
        XCTAssertEqual(result, 75)
    }
}
