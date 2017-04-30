import Foundation

/// Executes the operation.
///
/// - Parameters:
///   - operation: operation to be executed.
///   - completion: closure that will be called once the execution completes.
public func startup(_ operation: StartupOperation, completion: @escaping (Error?) -> ()) {
    let queue = DispatchQueue.global(qos: .background)
    operation.executeInQueue(queue, completion: completion)
}
