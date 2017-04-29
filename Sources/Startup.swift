import Foundation


/// Executes the operation.
///
/// - Parameters:
///   - operation: operation to be executed.
///   - completion: closure that will be called once the execution completes.
public func startup(operation: Operation, completion: @escaping (Error?) -> ()) {
    let queue = DispatchQueue.global(qos: .background)
    operation.execute(in: queue, completion: completion)
}

/// Executes the the operation operations in serie
///
/// - Parameters:
///   - operations: operations to be executed sequencially.
///   - completion: closure that will be called once all the operations complete.
public func startup(operations: [Operation], completion: @escaping (Error?) -> ()) {
    let serialOperation = SerialOperation(operations: operations)
    startup(operation: serialOperation, completion: completion)
}
