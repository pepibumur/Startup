import Foundation
import XCTest

@testable import Startup

final class ParallelStartupOperationTests: XCTestCase {
    
    func test_execute_executesTheOperationsInParallel() {
        var aCalled: Bool = false
        var bCalled: Bool = false
        let operationA = AnyStartupOperation(description: "test-a") {
            aCalled = true
        }
        let operationB = AnyStartupOperation(description: "test-b") { 
            bCalled = true
        }
        let parallel = ParallelStartupOperation(operationA, operationB)
        _ = try? parallel.execute()
        XCTAssertTrue(aCalled)
        XCTAssertTrue(bCalled)
    }
    
    func test_execute_throwsIfAnyOfTheOperationsThrowsAnError() {
        let errorToThrow = NSError(domain: "test-error", code: -1, userInfo: nil)
        let operationA = AnyStartupOperation(description: "test-a") {}
        let operationB = AnyStartupOperation(description: "test-b") {
            throw errorToThrow
        }
        let parallel = ParallelStartupOperation(operationA, operationB)
        do {
            try parallel.execute()
            XCTAssertTrue(false, "Expected error to be thrown but it didn't throw")
        } catch {
            XCTAssertEqual(error as NSError, StartupError.composed([errorToThrow]) as NSError)
        }
    }
    
}
