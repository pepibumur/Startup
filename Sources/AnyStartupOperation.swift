import Foundation

/// Operation that is initialized with the action that has to be executd.
struct AnyStartupOperation: StartupOperation {
    
    /// Operation description
    var description: String
    
    /// Action to be executed.
    private let closure: () throws -> ()
    
    /// Initializes the operation with the name and the action to be executed.
    ///
    /// - Parameters:
    ///   - description: operation description.
    ///   - closure: action to be executed.
    init(description: String, closure: @escaping () throws -> ()) {
        self.description = "Operation: \(description)"
        self.closure = closure
    }
    
    /// Executes the operation that has been passed as a closure.
    ///
    /// - Throws: throws an error if the operation fails.
    func execute() throws {
        try self.closure()
    }
    
}
