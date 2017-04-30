import Foundation

/// Typealias that represents a function that can be executed in a given queue notifying about its completion.
internal typealias ThreadExecutable = (DispatchQueue, @escaping (Error?) -> ()) -> ()

/// Typealias that represents a function that can execute multiple ThreadExecutable and notify its completion synchronously.
internal typealias SyncExecutor = ([ThreadExecutable]) throws -> ()

/// Executor that executes the executables concurrently blocking the execution thread.
///
/// - Parameter tasks: tasks to be executed.
/// - Throws: an error if any of the tasks failed.
internal func concurrentThreadExecutor(tasks: [ThreadExecutable]) throws {
    let group = DispatchGroup()
    var errors: [Error] = []
    let concurrentQueue = DispatchQueue(label: "startup-concurrent-queue", qos: .utility, attributes: .concurrent)
    tasks.forEach { (threadExecutable) in
        group.enter()
        threadExecutable(concurrentQueue) { error in
            if let error = error {
                errors.append(error)
            }
            group.leave()
        }
    }
    group.wait()
    if errors.count != 0 {
        throw StartupError.composed(errors)
    }
}
