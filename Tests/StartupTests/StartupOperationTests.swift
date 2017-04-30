import Foundation
import XCTest

@testable import Startup

final class OperationTests: XCTestCase {
    
    func test_catchRetry_retriesTheOperationAsManyTimesAsSpecified() {
        var calledCount: UInt = 0
        let operation = AnyStartupOperation(description: "test") {
            calledCount += 1
            throw NSError(domain: "test", code: -1, userInfo: nil)
        }
        _ = try? operation.catch(retry: 3).execute()
        XCTAssertEqual(calledCount, 3)
    }
    
    func test_catchRetry_returnsTheLastErrorAfterRetryingMultipleTimes() {
        let errorToThrow = NSError(domain: "test", code: -1, userInfo: nil)
        let operation = AnyStartupOperation(description: "test") {
            throw errorToThrow
        }
        do {
            try operation.catch(retry: 3).execute()
            XCTAssertTrue(false, "Expected to throw an error but it didn't throw anything")
        } catch {
            XCTAssertEqual(error as NSError, errorToThrow)
        }
    }
    
    func test_silent_silencesTheError() {
        let operation = AnyStartupOperation(description: "test") {
            throw NSError(domain: "test", code: -1, userInfo: nil)
        }.silent()
        do {
            try operation.execute()
        } catch {
            XCTAssertTrue(false, "Expected operation not to throw")
        }
    }
}
