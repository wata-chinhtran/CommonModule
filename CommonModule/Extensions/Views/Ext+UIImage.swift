

import UIKit

extension UIImage {

    static func from(color: UIColor, withRect rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)) -> UIImage {        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }

    static func from(view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, view.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        view.layer.render(in: context)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        return img
    }

    static func circleImage(size: CGSize, borderWidth: CGFloat = 0, borderColor: UIColor? = nil, fillColor: UIColor) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        let fillPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        context.addPath(fillPath.cgPath)
        context.setFillColor(fillColor.cgColor)
        context.fillPath()
        if let strokeColor = borderColor?.cgColor {
            let strokePath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            context.addPath(strokePath.cgPath)
            context.setStrokeColor(strokeColor)
            context.setLineWidth(borderWidth)
            context.strokePath()
        }
        let img = UIGraphicsGetImageFromCurrentImageContext()
        return img
    }

    func tint(with color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return self }

        // flip the image
        context.scaleBy(x: 1.0, y: -1.0)
        context.translateBy(x: 0.0, y: -self.size.height)

        // multiply blend mode
        context.setBlendMode(.multiply)

        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context.clip(to: rect, mask: self.cgImage!)
        color.setFill()
        context.fill(rect)

        // create UIImage
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return self }
        UIGraphicsEndImageContext()

        return newImage
    }

    // MARK: - Resize image extension
    func convert(toSize size: CGSize, scale: CGFloat = 1) -> UIImage {
        let imgRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        self.draw(in: imgRect)
        let copied = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return copied!
    }

    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }



    /**
     Create a rounded corners image.

     - Parameter alpha: Alpha of new image.

     - Returns: Reduced alpha of image.
     */
    func setAlpha(_ alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0)

        let context = UIGraphicsGetCurrentContext()!
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)

        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -rect.size.height)
        context.setBlendMode(.multiply)
        context.setAlpha(alpha)
        context.draw(self.cgImage!, in: rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
