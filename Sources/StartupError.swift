import Foundation

/// Startup error.
///
/// - composed: error that is composed by multiple errors.
public enum StartupError: Error {
    case composed([Error])
}
