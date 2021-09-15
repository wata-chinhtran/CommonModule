

import UIKit

extension UIEdgeInsets {
    init(margin: CGFloat) {
        self.init(top: margin, left: margin, bottom: margin, right: margin)
    }
    
    init(top: CGFloat = 0, left: CGFloat = 0, bot: CGFloat = 0, right: CGFloat = 0) {
        self.init(top: top, left: left, bottom: bot, right: right)
    }
}
