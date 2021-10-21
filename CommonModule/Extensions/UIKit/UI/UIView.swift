


import UIKit

extension UIView {
    
    /// View will be spin around animation in the duration value
    ///
    /// - Parameters:
    ///   - duration: Time to animation. Type: Double
    ///   - repeatCount: Number of repeat. Type: Float. Default is infinity
    func runSpinAnimation(duration: Double, repeatCount: Float = Float.infinity) {
        let rotationAnimation: CABasicAnimation
        rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber.init(value: 2 * Double.pi)
        rotationAnimation.duration = duration
        rotationAnimation.repeatCount = repeatCount
        layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat, with customRect: CGRect? = nil) {
        let rect: CGRect
        if let customRect = customRect {
            rect = customRect
        } else {
            rect = self.bounds
        }
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func addShadow(_ shadowInsets: UIEdgeInsets, shadowOffset: CGSize, shadowColor: CGColor?, shadowRadius: CGFloat, shadowOpacity: CGFloat, isMasksToBounds masksToBounds: Bool, expandHeight exHeight: CGFloat) {
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = Float(shadowOpacity)
        layer.masksToBounds = masksToBounds
        var rect = bounds
        rect.size.height = rect.size.height + exHeight
        
        let shadowPath = UIBezierPath(rect: rect.inset(by: shadowInsets))
        layer.shadowPath = shadowPath.cgPath
    }
    
    
//    func addTo(view: UIView) -> UIView {
//        view.addSubview(self)
//        return self
//    }
//
//    func addToView(_ view: UIView) {
//        view.addSubview(self)
//    }
//
//    func applyShadow(
//        offset: CGSize,
//        opacity: Float,
//        blur: CGFloat = 2,
//        shadowColor: UIColor = UIColor(rgb: 0xB8B8B8)
//    ) {
//        layer.masksToBounds = false
//        layer.shadowOffset = offset
//        layer.shadowRadius = blur
//        layer.shadowOpacity = opacity
//        layer.shadowColor = shadowColor.cgColor
//    }
    
    func applyBorder(width: CGFloat, color: UIColor) {
        layer.masksToBounds = true
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func applyBorder(width: CGFloat, color: UIColor, lineDash dashPattern: [NSNumber]?) {
        let borderLayout = CAShapeLayer()
        borderLayout.strokeColor = color.cgColor
        borderLayout.lineDashPattern = dashPattern
        borderLayout.frame = self.bounds
        borderLayout.fillColor = nil
        borderLayout.path = UIBezierPath(rect: self.bounds).cgPath
        self.layer.addSublayer(borderLayout)
    }
    
//    /// Mark subview as constraint-able and add as subview.
//    ///
//    /// - Parameter subview: Subview.
//    func add(_ subview: UIView) {
//        subview.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(subview)
//    }
//
//    func showSideMenu(_ isShow: Bool, duration: Double, headerView: HeaderView) {
//        let frameX: CGFloat = 0.0
//        let rootViewScale: CGFloat = isShow ? kScaleScreenPercent : 1.0
//
//        let scale = CGAffineTransform(scaleX: rootViewScale, y: rootViewScale)
//        let translate = CGAffineTransform(translationX: frameX, y: 0.0)
//
//        UIView.animate(withDuration: duration) {
//
//            if DeviceHelper.isPhoneX{
//                headerView.heightConstraintOfTopView.constant = isShow ? 0:44
//                headerView.layoutIfNeeded()
//            }
//
//            headerView.frame = CGRect(x: 0, y: 0, width: headerView.frame.size.width, height: headerView.frame.size.height + (isShow ? -DeviceHelper.topSafeAreaHeight : DeviceHelper.topSafeAreaHeight))
//            self.transform = scale.concatenating(translate)
//        }
//    }
}

// MARK: - Design
extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let borderColor = layer.borderColor{
                return  UIColor.init(cgColor: borderColor)
            }
            return nil
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

//extension UIView {
//    /// calculate frame of view in the main window
//    var originFrame: CGRect {
//        return self.superview?.convert(self.frame, to: nil) ?? self.frame
//    }
//
//    /// get scroll view that contains this view
//    func rootScrollView() -> UIScrollView? {
//        guard let view = self.superview else { return nil }
//
//        if let scrollView = view as? UIScrollView {
//            return scrollView
//        }
//        return view.rootScrollView()
//    }
//
//}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5
        layer.masksToBounds = false
    }
    
    func dropShadow(shadowColor: UIColor, shadowOpacity: Float, shadowRadius: CGFloat) {
        layer.masksToBounds = false
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    }
    
    func fadeTransition(_ duration: CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.subtype = .fromTop
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
    func cornerRadiusWithShadow(radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
//    func madeShadowHasRadius(color: UIColor = .black, alpha: Float = 0.1,
//                             x: CGFloat = 0, y: CGFloat = 4, blur: CGFloat = 16, spread: CGFloat = 0, radius: CGFloat = kButtonCorner) {
//        cornerRadiusWithShadow(radius: radius)
//        layer.applySketchShadow(color: color, alpha: alpha, x: x, y: y, blur: blur, spread: spread)
//    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
extension UIColor{
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}

//@IBDesignable
//public class CommonGradient: UIView {
//    @IBInspectable var startColor:   UIColor = ColorManager.shared.startBGGradientColor { didSet { updateColors() }}
//    @IBInspectable var endColor:     UIColor = ColorManager.shared.endBGGradientColor { didSet { updateColors() }}
//    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
//    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
//    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
//    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
//
//    override public class var layerClass: AnyClass { CAGradientLayer.self }
//
//    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
//
//    func updatePoints() {
//        if horizontalMode {
//            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
//            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
//        } else {
//            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
//            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
//        }
//    }
//    func updateLocations() {
//        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
//    }
//    func updateColors() {
//        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
//    }
//    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//        updatePoints()
//        updateLocations()
//        updateColors()
//    }
//}
