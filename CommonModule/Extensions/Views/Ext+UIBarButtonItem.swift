

import UIKit

extension UIBarButtonItem {
    static func negativeSpace(width: CGFloat) -> UIBarButtonItem {
        let negativeSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpace.width = width
        return negativeSpace
    }
}
