

import UIKit

extension UITextField {
    func addSpaceLeft(width: CGFloat, mode: UITextField.ViewMode) {
        guard self.leftView == nil else { return }

        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: frame.height))
        leftView.backgroundColor = UIColor.clear
        self.leftView = leftView
        self.leftViewMode = mode
    }

    func addSpaceRight(width: CGFloat, mode: UITextField.ViewMode) {
        guard self.rightView == nil else { return }

        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: frame.height))
        self.rightView = rightView
        self.rightViewMode = mode
    }
}
