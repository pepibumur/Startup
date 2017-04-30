import Foundation

/// Operation that executes other operations serially
public struct ParallelStartupOperation: StartupOperation {
    
    /// Operation description
    public var description: String {
        var serialDescription = "Parallel Operation:\n"
        serialDescription.append(self.operations.map { "  - \($0.description)" }.joined(separator: "\n"))
        return serialDescription
    }
    
    private let operations: [StartupOperation]
    
    /// Initializes SerialOperation with the operations that will be executed serially.
    ///
    /// - Parameter operations: operation sto be executed serially.
    public init(_ operations: StartupOperation...) {
        self.operations = operations
    }
    
    /// Executes all the operations serially.
    ///
    /// - Throws: an error if any of the operations fails. If that happens, the remaining operations won't be executed.
    public func execute() throws {
        try self.execute(executor: concurrentThreadExecutor)
    }
    
    internal func execute(executor: SyncExecutor) throws  {
        try executor(operations.map {$0.executeInQueue})
    }
}
