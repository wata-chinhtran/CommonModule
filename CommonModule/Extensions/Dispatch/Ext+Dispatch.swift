

import Foundation

/**
 Dispatch
 */
func dispatch_main(_ action: @escaping (() -> Void)) {
    DispatchQueue.main.async {
        action()
    }
}

func dispatch_background(_ action: @escaping (() -> Void)) {
    DispatchQueue.global().async {
        action()
    }
}
