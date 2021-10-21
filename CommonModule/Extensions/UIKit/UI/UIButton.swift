
import UIKit

extension UIButton {
    @IBInspectable var imageAfterTitleStyle: Bool {
        get{
            return false
        }
        set {
            if newValue == true {
                self.semanticContentAttribute = .forceRightToLeft
                self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15.0, bottom: 0, right: 0)
                self.layer.masksToBounds = false
                layoutIfNeeded()
            }else{
                self.semanticContentAttribute = .unspecified
                self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        }
    }
    
    func applyImageIconBeforeTextStyle() {
        self.semanticContentAttribute = .forceLeftToRight
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0.0, bottom: 0, right: 15.0)
    }
    
//    func applyPrimary2Style() {
//        titleLabel?.font = FontsManager.shared.sourceSansPro.black(12.0)
//        setTitleColor(ColorManager.shared.blue_text_color, for: .normal)
//        backgroundColor = .clear
//        imageAfterTitleStyle = true
//        isUserInteractionEnabled = true
//    }
//
//    func applyDisabledStyle() {
//        titleLabel?.font = FontsManager.shared.sourceSansPro.black(12.0)
//        setTitleColor(ColorManager.shared.white, for: .normal)
//        backgroundColor = ColorManager.shared.disabledBg
//        isUserInteractionEnabled = false
//    }
//
//    func applyPrimaryStyle() {
//        titleLabel?.font = FontsManager.shared.sourceSansPro.black(12.0)
//        setTitleColor(ColorManager.shared.white, for: .normal)
//        backgroundColor = ColorManager.shared.button
//        cornerRadius = kButtonCorner
//        isUserInteractionEnabled = true
//    }
//
//    func applySecondaryStyle() {
//        titleLabel?.font = FontsManager.shared.sourceSansPro.black(12.0)
//        setTitleColor(ColorManager.shared.labelColor, for: .normal)
//        backgroundColor = ColorManager.shared.buttonSecondary
//        cornerRadius = kButtonCorner
//        borderColor = ColorManager.shared.borderColor
//        borderWidth = 1.0
//        isUserInteractionEnabled = true
//    }
    
    func selectedWith(_ color: UIColor) {
        setImage(UIImage(named: "white_check_ic"), for: .normal)
        backgroundColor = color
        borderWidth = 0.0
        cornerRadius = bounds.height/2
    }
    
    func unselectWith(_ color: UIColor) {
        setImage(nil, for: .normal)
        backgroundColor = .clear
        borderWidth = 2.0
        borderColor = color
        cornerRadius = bounds.height/2
    }
//    public func isEnableStatus(isEnable: Bool) {
//        if isEnable {
//            self.backgroundColor = ColorManager.shared.tabbarviewBackgroud
//            self.isEnabled = true
//        } else {
//            self.backgroundColor = ColorManager.shared.buttonDisable
//            self.isEnabled = false
//        }
//    }
    
}

extension UISwitch {

    func set(width: CGFloat, height: CGFloat) {

        let standardHeight: CGFloat = 24
        let standardWidth: CGFloat = 44

        let heightRatio = height / standardHeight
        let widthRatio = width / standardWidth

        transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
}
extension UIButton {
    private func imageWithColor(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(color.cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }

    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(imageWithColor(color: color), for: state)
    }
}
