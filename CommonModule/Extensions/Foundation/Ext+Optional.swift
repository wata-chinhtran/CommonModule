

import Foundation

protocol Optionable {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

// extension for Optional provides the implementations for Optional enum
extension Optional: Optionable {
    var value: Wrapped? {
        return self
    }

    func withDefault(_ value: Wrapped) -> Wrapped {
        return self ?? value
    }
}
