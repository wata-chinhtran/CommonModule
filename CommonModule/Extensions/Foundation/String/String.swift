
import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont, numOfLine: Int = 0) -> CGFloat {
       let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
       label.numberOfLines = numOfLine
       label.text = self
       label.font = font
       label.sizeToFit()

       return label.frame.height
    }
    
    func localized() -> String{
        return NSLocalizedString(self, comment: "")
    }
    
    func localizedUppercase() -> String{
        return NSLocalizedString(self, comment: "").uppercased()
    }
    
    func localizedLowercase() -> String{
        return NSLocalizedString(self, comment: "").lowercased()
    }
    
    func localizedCapitalized() -> String{
        return NSLocalizedString(self, comment: "").capitalized
    }
    
    func localizedCapitalizedFirstCharacter() -> String{
        return NSLocalizedString(self, comment: "").capitalizingFirstLetter()
    }
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

@IBDesignable
class InsetLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 4.0
    @IBInspectable var leftInset: CGFloat = 4.0
    @IBInspectable var bottomInset: CGFloat = 4.0
    @IBInspectable var rightInset: CGFloat = 4.0

    var insets: UIEdgeInsets {
        get {
            return UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        }
        set {
            topInset = newValue.top
            leftInset = newValue.left
            bottomInset = newValue.bottom
            rightInset = newValue.right
        }
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var adjSize = super.sizeThatFits(size)
        adjSize.width += leftInset + rightInset
        adjSize.height += topInset + bottomInset
        return adjSize
    }

    override var intrinsicContentSize: CGSize {
        let systemContentSize = super.intrinsicContentSize
        let adjustSize = CGSize(width: systemContentSize.width + leftInset + rightInset, height: systemContentSize.height + topInset +  bottomInset)
        if adjustSize.width > preferredMaxLayoutWidth && preferredMaxLayoutWidth != 0 {
            let constraintSize = CGSize(width: bounds.width - (leftInset + rightInset), height: .greatestFiniteMagnitude)
            let newSize = super.sizeThatFits(constraintSize)
            return CGSize(width: systemContentSize.width, height: ceil(newSize.height) + topInset + bottomInset)
        } else {
            return adjustSize
        }
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
}
