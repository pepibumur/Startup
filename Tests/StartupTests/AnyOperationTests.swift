import Foundation
import XCTest

@testable import Startup

class AnyOperationTests: XCTestCase {

    func test_description_returnsTheCorrectValue() {
        let operation = AnyStartupOperation(description: "description") {}
        XCTAssertEqual(operation.description, "Operation: description")
    }
    
    func test_execute_executesTheClosureAction() {
        var called: Bool = false
        let operation = AnyStartupOperation(description: "description") {
            called = true
        }
        _ = try? operation.execute()
        XCTAssertTrue(called)
    }
    
    func test_execute_forwardsTheErrorFromTheClosure() {
        let errorToForward: NSError = NSError(domain: "test", code: 1, userInfo: nil)
        let operation = AnyStartupOperation(description: "test") { 
            throw errorToForward
        }
        do {
            try operation.execute()
            XCTAssertTrue(false, "Expected error to be thrown but nothing got thrown")
        } catch {
            XCTAssertEqual(error as NSError, errorToForward)
        }
    }
    
}
