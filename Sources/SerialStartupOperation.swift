import Foundation

/// Operation that executes other operations serially
public struct SerialStartupOperation: StartupOperation {
    
    /// Operation description
    public var description: String {
        var serialDescription = "Serial Operation:\n"
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
        try operations.forEach { (operation) in
            try operation.execute()
        }
    }
    
}
