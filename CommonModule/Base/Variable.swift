



import Foundation

/// Binding data
open class Variable<T> {
    typealias Listener = (T) -> Void
     var listeners: [Listener] = []

    /// The value
    var value: T {
        didSet {
            listeners.forEach { $0(value) }
        }
    }
    
    /// Initiate a new Variable with a new value
    ///
    /// - Parameter value: Any type
    init(_ value: T) {
        self.value = value
    }
    
    /// Observer when the value changes
    ///
    /// - Parameter listener: A closure
    func bind(_ listener: @escaping Listener) {
        listeners.append(listener)
    }
    
    /// Observer when the value changes (included initiate)
    ///
    /// - Parameter listener: A closure
    func bindAndFire(_ listener: @escaping Listener) {
        listeners.append(listener)
        listener(value)
    }
    
    /// Remove all current listeners
    func clearListeners() {
        listeners.removeAll()
    }
}
