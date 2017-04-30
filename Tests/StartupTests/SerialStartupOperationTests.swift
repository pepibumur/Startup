import Foundation
import XCTest

@testable import Startup

final class SerialStartupOperationTests: XCTestCase {
    
    func test_execute_executesTheOperationsSerially() {
        var aCalled: Bool = false
        var bCalled: Bool = false
        let operationA = AnyStartupOperation(description: "test-a") {
            aCalled = true
            XCTAssertTrue(aCalled)
            XCTAssertFalse(bCalled)
        }
        let operationB = AnyStartupOperation(description: "test-b") {
            bCalled = true
        }
        _ = try? SerialStartupOperation(operationA, operationB).execute()
        XCTAssertTrue(aCalled)
        XCTAssertTrue(bCalled)
    }
    
}
