

import UIKit

extension CALayer {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat, layerBounds: CGRect? = nil) {
        let rect = layerBounds == nil ? self.bounds : layerBounds!
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.fillColor = UIColor.lightGray.cgColor
        self.mask = mask
    }

    func border(_ width: CGFloat, radius: CGFloat, layerBounds: CGRect? = nil, color: UIColor?) {
        let rect = layerBounds == nil ? self.bounds : layerBounds!
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: .allCorners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        let borderLayer = CAShapeLayer()
        borderLayer.path = path.cgPath
        borderLayer.lineWidth = width
        borderLayer.strokeColor = (color ?? .clear).cgColor
        borderLayer.fillColor = nil
        self.sublayers?.forEach { $0.removeFromSuperlayer() }
        self.addSublayer(borderLayer)
    }
}
