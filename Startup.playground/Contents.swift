import Foundation
import Startup

/// Operations must conform the StartupOperation protocol.
/// - description: returns information about the operation. It's very useful when debugging.
/// - esdecute: main operation method that executes the operation's action.
struct PrintOperation: StartupOperation {

    let description: String
    
    func execute() throws {
        print(description)
    }
    
}

struct ErrorOperation: StartupOperation {
    
    let description: String
    
    func execute() throws {
        throw NSError(domain: "startup-error", code: -1, userInfo: nil)
    }
    
}

/// Operations can be created by combining operations in serially or in parallel.

let operation = SerialStartupOperation(
    PrintOperation(description: "First Operation"),
    PrintOperation(description: "Second Operation"),
    ParallelStartupOperation(
        PrintOperation(description: "Third Operation - Part A"),
        PrintOperation(description: "Third Operation - Part B"),
        PrintOperation(description: "Third Operation - Part C")
    ),
    ErrorOperation(description: "Fourth Operation")
        .silent(),
    ErrorOperation(description: "Fifth Operation")
        .catch(retry: 3)
)

/// Once your operation is defined, you can call startup passing your operation and it'll execute the operations in the right order. It'll notify when the execution completes, passing an error if any of the operations failed.
startup(operation) { (error) in
    if let error = error {
        print("Something went wrong: \(error)")
    } else {
        print("Startup did complete")
    }
}