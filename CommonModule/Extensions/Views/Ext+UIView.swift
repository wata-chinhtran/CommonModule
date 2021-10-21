

import UIKit

private var zkExtraDataPointer: Void?
extension UIView {
    var zkExtraData: Any? {
        get {
            return objc_getAssociatedObject(self, &zkExtraDataPointer) as Any?
        }

        set {
            objc_setAssociatedObject(self, &zkExtraDataPointer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

//    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(
//            roundedRect: self.bounds,
//            byRoundingCorners: corners,
//            cornerRadii: CGSize(width: radius, height: radius)
//        )
//
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        self.layer.mask = mask
//    }

    func roundCorners(radius: CGFloat) {
        self.layer.shouldRasterize = !(self is UIImageView)
        self.layer.rasterizationScale = UIScreen.main.scale
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }

    func addTo(view: UIView) -> UIView {
        view.addSubview(self)
        return self
    }

    func addToView(_ view: UIView) {
        view.addSubview(self)
    }

    func applyShadow(
        offset: CGSize,
        opacity: Float,
        blur: CGFloat = 2,
        shadowColor: UIColor = UIColor(rgb: 0xB8B8B8)
    ) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowRadius = blur
        layer.shadowOpacity = opacity
        layer.shadowColor = shadowColor.cgColor
    }

    /// Mark subview as constraint-able and add as subview.
    ///
    /// - Parameter subview: Subview.
    func add(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
    }
}

// MARK: Ripple animation
extension UIView {
//    private struct AssociatedKeys {
//        static var animTouchLayer: UInt8 = 0
//    }
//
//    var animTouchLayer: CALayer? {
//        set { objc_setAssociatedObject(self, &AssociatedKeys.animTouchLayer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
//        get { return objc_getAssociatedObject(self, &AssociatedKeys.animTouchLayer) as? CALayer }
//    }
//
//    func startTouchAnimation(at startPoint: CGPoint,
//                             withColor color: UIColor = UIColor(white: 0.95, alpha: 1),
//                             duration: TimeInterval = 0.25,
//                             radius: CGFloat = 0) {
//        // Remove old animation layer
//        animTouchLayer?.removeAllAnimations()
//        animTouchLayer?.removeFromSuperlayer()
//
//        let bounds = self.bounds
//        let x = bounds.width
//        let y = bounds.height
//
//        var hasLimit = (self.backgroundColor != nil && self.backgroundColor! != .clear)
//            || self.layer.borderWidth > 0
//        let origin = hasLimit ? startPoint : CGPoint(x: x/2, y: y/2)
//
//        // Build an array with the four corners of the view.
//        let corners = [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: y), CGPoint(x: x, y: 0), CGPoint(x: x, y: y)]
//
//        // Calculate the corner closest to the origin and the one farther from it.
//        // We might not need these values, but calculate them anyway so that the code
//        // is clearer.
//        var minDistance = CGFloat.greatestFiniteMagnitude
//        var maxDistance = CGFloat(-1)
//
//        corners.forEach {
//            // Calculate distance of two points
//            let d = sqrt(pow(fabs(origin.x - $0.x), 2) + pow(fabs(origin.y - $0.y), 2))
//            minDistance = min(d, minDistance)
//            maxDistance = max(d, maxDistance)
//        }
//
//        // Calculate the start and end radius of our ripple effect.
//        // If the ripple starts inside the view then the start radis is 0, if it
//        // starts outside the view then make the radius the distance to the nearest corner.
//        let originInside = origin.x > 0 && origin.x < x && origin.y > 0 && origin.y < y
//        // Note that if 0 is used as a default value then the circle may look misshapen.
//        let startRadius = originInside ? 0.1 : minDistance
//
//        // If we set a radius use it, if not then use the distance to the farthest corner.
//        let endRadius = radius > 0 ? radius : maxDistance
//
//        hasLimit = hasLimit || endRadius > 40
//
//        // Create paths for out start and end circles.
//        let startPath = UIBezierPath(arcCenter: origin,
//                                     radius: startRadius,
//                                     startAngle: 0,
//                                     endAngle: CGFloat(Double.pi * 2),
//                                     clockwise: true)
//        let endPath = UIBezierPath(arcCenter: origin,
//                                   radius: endRadius,
//                                   startAngle: 0,
//                                   endAngle: CGFloat(Double.pi * 2),
//                                   clockwise: true)
//
//        // Create a new layer to draw the ripple on.
//        let rippleLayer = CAShapeLayer()
//        rippleLayer.frame = self.layer.bounds
//        rippleLayer.name = "RIPPLE_LAYER"
//        animTouchLayer = rippleLayer
//
//        // Make sure the ripple effect doesn't "leave" the view.
//        rippleLayer.masksToBounds = hasLimit ? true : false
//        rippleLayer.cornerRadius = self.layer.cornerRadius
//
//        rippleLayer.fillColor = color.withAlphaComponent(0.4).cgColor
//
//        // Create the animation
//        let rippleAnimation = CABasicAnimation(keyPath: "path")
//        rippleAnimation.fillMode = kCAFillModeBoth
//        rippleAnimation.duration = duration
//        rippleAnimation.fromValue = startPath.cgPath
//        rippleAnimation.toValue = endPath.cgPath
//        rippleAnimation.isRemovedOnCompletion = false
//        rippleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
//
//        // Set the ripple layer to be just above the bg.
//        self.layer.insertSublayer(rippleLayer, at: 0)
//        // Give the ripple layer the animation.
//        rippleLayer.add(rippleAnimation, forKey: nil)
//    }
//
//    func endTouchAnimation() {
//        let duration = 0.15
//
//        // Add a fade out animation.
//        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
//        fadeAnimation.fillMode = kCAFillModeBoth
//        fadeAnimation.duration = 0.15
//        fadeAnimation.fromValue = 1.0
//        fadeAnimation.toValue = 0.0
//        fadeAnimation.isRemovedOnCompletion = false
//        animTouchLayer?.add(fadeAnimation, forKey: nil)
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
//            // All animations are done, so remove the layer.
//            self.animTouchLayer?.removeAllAnimations()
//            self.animTouchLayer?.removeFromSuperlayer()
//        }
//    }
}


extension UIView {
    /// calculate frame of view in the main window
    var originFrame: CGRect {
        return self.superview?.convert(self.frame, to: nil) ?? self.frame
    }

    /// get scroll view that contains this view
    func rootScrollView() -> UIScrollView? {
        guard let view = self.superview else { return nil }

        if let scrollView = view as? UIScrollView {
            return scrollView
        }
        return view.rootScrollView()
    }
}


extension UIView {

//    /// Set view background color with gradient.
//    ///
//    /// - Parameters:
//    ///   - startColor: Start color of gradient.
//    ///   - endColor: End color of gradient.
//    ///   - size: Size of view.
//    ///   - horizontal: Gradient horizontally or vertically.
//    func setGradient(startColor: UIColor, endColor: UIColor, size: CGSize, horizontal: Bool = false) {
//        self.setGradient(startColor: startColor, endColor: endColor, frame: CGRect(x: 0, y: 0, width: size.width, height: size.height), horizontal: horizontal)
//    }

//    /// Set view background color with gradient.
//    ///
//    /// - Parameters:
//    ///   - startColor: Start color of gradient.
//    ///   - endColor: End color of gradient.
//    ///   - frame: Frame of view.
//    ///   - horizontal: Gradient horizontally or vertically.
//    @discardableResult
//    func setGradient(startColor: UIColor, endColor: UIColor, frame: CGRect, horizontal: Bool = false) -> CAGradientLayer {
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.frame = frame
//        gradient.colors = [startColor.cgColor, endColor.cgColor]
//
//        if horizontal {
//            gradient.startPoint = CGPoint(y: 0)
//            gradient.endPoint = CGPoint(x: 1, y: 1)
//        }
//
//        self.layer.insertSublayer(gradient, at: 0)
//        return gradient
//    }


    /// Safe insets
    var safeInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            var insets = UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
            insets.top = max(20, insets.top)
            return insets
        } else {
            return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        }
    }
}
