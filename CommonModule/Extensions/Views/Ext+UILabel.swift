

import Foundation

extension UILabel {
    
    /// Size that fit to the label, constraints width = Screen.width, height = MAXFLOAT.
    var fitSize: CGSize {
        return self.fitSize(padding: 0)
    }
    
    /// Size that fit to the label with given horizontal padding, constraints width = Screen.width, height = MAXFLOAT.
    ///
    /// - Parameter width: Maximum width.
    /// - Returns: Fit size.
    func fitSize(width: CGFloat) -> CGSize {
        return self.sizeThatFits(CGSize(width: width, height: MAXFLOAT.cgFloat))
    }
    
    /// Size that fit to the label with given horizontal padding, constraints width = Screen.width, height = MAXFLOAT.
    ///
    /// - Parameter padding: Horizontal padding of label.
    /// - Returns: Fit size.
    func fitSize(padding: CGFloat) -> CGSize {
        return self.sizeThatFits(CGSize(width: Screen.width - padding, height: MAXFLOAT.cgFloat))
    }
    
    /// Configure line spacing for label.
    ///
    /// - Parameter lineSpacing: Line spacing.
    func config(lineSpacing: CGFloat) {
        if self.text == nil || self.text!.count <= 0 || self.numberOfLines == 1 { return }
        let textAlignment = self.textAlignment
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        let attributedText = NSMutableAttributedString(attributedString: self.attributedText!)
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        self.attributedText = attributedText
        self.textAlignment = textAlignment
    }    
    
    /// Configure label text with given attributes.
    ///
    /// - Parameters:
    ///   - range: Range of text.
    ///   - font: Font of text.
    ///   - color: Color of text.
    func config(range: NSRange?, color: UIColor) {
        guard
            let r = range,
            let allAttributedText = self.attributedText
            else { return }
        
        let attributedText = NSMutableAttributedString(attributedString: allAttributedText)
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: color]
        attributedText.addAttributes(attributes, range: r)
        self.attributedText = attributedText
    }
    
    /// Configure label text with given attributes.
    ///
    /// - Parameters:
    ///   - range: Range of text.
    ///   - font: Font of text.
    ///   - color: Color of text.
    func config(range: NSRange?, font: UIFont) {
        guard
            let r = range,
            let allAttributedText = self.attributedText
            else { return }
        
        let attributedText = NSMutableAttributedString(attributedString: allAttributedText)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        attributedText.addAttributes(attributes, range: r)
        self.attributedText = attributedText
    }
    
    /// Configure label text with given attributes.
    ///
    /// - Parameters:
    ///   - range: Range of text.
    ///   - attributes: Attributes of text.
    func config(range: NSRange?, attributes: [NSAttributedString.Key: Any]) {
        guard
            let r = range,
            let allAttributedText = self.attributedText
            else { return }
        
        let attributedText = NSMutableAttributedString(attributedString: allAttributedText)
        attributedText.addAttributes(attributes, range: r)
        self.attributedText = attributedText
    }
    
    /// Configure label text with given attributes.
    ///
    /// - Parameters:
    ///   - text: Text to be configured.
    ///   - font: Font of text.
    ///   - color: Color of text.
    func config(text: String?, font: UIFont, color: UIColor) {
        guard let t = text else { return }
        self.config(text: t, attributes: [.font: font,
                                          .foregroundColor: color])
    }
    
    /// Configure label text with given attributes.
    ///
    /// - Parameters:
    ///   - text: Text to be configured.
    ///   - color: Color of text.
    func config(text: String?, color: UIColor, folding: Bool = false) {
        guard let t = text else { return }
        self.config(text: t, attributes: [.foregroundColor: color], folding: folding)
    }
    
    /// Configure label text with given attributes.
    ///
    /// - Parameters:
    ///   - text: Text to be configured.
    ///   - font: Font of text.
    func config(text: String?, font: UIFont, folding: Bool = false) {
        guard let t = text else { return }
        self.config(text: t, attributes: [.font: font], folding: folding)
    }
    
    /// Configure label text with given attributes.
    ///
    /// - Parameters:
    ///   - text: Text to be configured.
    ///   - attributes: Attributes of text.
    func config(text: String, attributes: [NSAttributedString.Key: Any], folding: Bool = false) {
        self.config(texts: [text], attributes: attributes, folding: folding)
    }
    
    /// Configure multiple texts of label with given attributes.
    ///
    /// - Parameters:
    ///   - texts: Texts that contained in label.
    ///   - attributes: Attributes of text.
    func config(texts: [String], attributes: [NSAttributedString.Key: Any], folding: Bool = false) {
        guard
            let allText = self.text,
            let allAttributedText = self.attributedText
            else { return }
        
        var compareText = allText
        var findTexts = [String]()
        if folding {
            compareText = allText.folding(options: String.CompareOptions.diacriticInsensitive, locale: nil).lowercased()
            texts.forEach { item in
                findTexts.append(item.folding(options: String.CompareOptions.diacriticInsensitive, locale: nil).lowercased())
            }
        } else {
            findTexts = texts
        }
        
        let attributedText = NSMutableAttributedString(attributedString: allAttributedText)
        for text in Array(Set(findTexts)) {
            do {
                let range = NSMakeRange(0, compareText.count)
                let pattern = text
                let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
                let matches = regex.matches(in: compareText, range: range)
                for match in matches {
                    attributedText.addAttributes(attributes, range: match.range)
                }
            } catch {
                continue
            }
        }
        self.attributedText = attributedText
        
    }
    
    /// Configure strike through attribute for label.
    func configStrikeThrough() {
        let attributedText = NSMutableAttributedString(attributedString: self.attributedText!)
        attributedText.addAttribute(.strikethroughStyle, value: 1, range: NSMakeRange(0, attributedText.length))
        self.attributedText = attributedText
    }
    
    /// Get number of lines
    var maxLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font!], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        
        return linesRoundedUp
    }
}
