

import UIKit
import CoreImage

extension UIImageView {
    func blurImage(radius: CGFloat) {
        guard let img = self.image else {
            return
        }

        let context = CIContext(options: nil)
        let inputImage = CIImage(image: img)
        let originalOrientation = img.imageOrientation
        let originalScale = img.scale

        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(radius, forKey: kCIInputRadiusKey)
        let outputImage = filter?.outputImage

        var cgImage: CGImage?

        if let asd = outputImage, let rect = inputImage?.extent {
            cgImage = context.createCGImage(asd, from: rect)
        }

        if let cgImageA = cgImage {
            let newImage = UIImage(cgImage: cgImageA, scale: originalScale, orientation: originalOrientation)
            self.image = newImage
        }
    }
}
