
import UIKit

extension UITextField {
    func applyEmailStyle() {
        keyboardType = .emailAddress
    }
    
    func addPaddingLeft(_ spacing: CGFloat) {
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: bounds.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
    func addPaddingRight(_ spacing: CGFloat) {
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: bounds.height))
        rightView = paddingView
        leftViewMode = .always
    }
}
