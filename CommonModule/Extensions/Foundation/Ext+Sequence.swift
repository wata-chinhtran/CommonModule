

import Foundation

extension Array {
    func firstOrDefault(_ defaultValue: Element) -> Element {
        return self.first ?? defaultValue
    }
}
