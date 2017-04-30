import Foundation

/// Protocol that defines an operation to be executed.
public protocol StartupOperation: CustomStringConvertible {
    
    /// Name of the operation that will be executed.
    /// Name will be useful when debugging the execution of the operations.
    var description: String { get }
    
    /// Executes all the operations serially.
    ///
    /// - Throws: an error if any of the operations fails.
    func execute() throws
    
}

// MARK: - Operation Extension (Queueing)

internal extension StartupOperation {
    
    /// Executes the operation asynchronously in the given queue
    ///
    /// - Parameters:
    ///   - queue: queue where the operation will be executed.
    ///   - completion: closure that will be called once the operation completes.
    func executeInQueue(_ queue: DispatchQueue, completion: @escaping (Error?) -> ()) {
        queue.async {
            do {
                try self.execute()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    
}

// MARK: - Operation Extension (Error Handling)

public extension StartupOperation {
    
    /// It returns another operation that retries if the wrapped operation fails.
    ///
    /// - Parameter retry: number of times it should be retried.
    /// - Returns: operation that retries the execution in case it fails.
    func `catch`(retry: UInt) -> StartupOperation {
        return AnyStartupOperation(description: self.description, closure: {
            for i in 0..<retry {
                do {
                    try self.execute()
                } catch {
                    if i == retry - 1 {
                        throw error
                    }
                }
            }
        })
    }
    
    /// Returns an operation that silences the error.
    ///
    /// - Returns: operation that silences the error if the wrapped operation throws any.
    func silent() -> StartupOperation {
        return AnyStartupOperation(description: self.description, closure: {
            do {
                try self.execute()
            } catch {}
        })
    }
    
    
}
