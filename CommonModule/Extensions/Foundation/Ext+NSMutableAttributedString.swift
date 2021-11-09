import Foundation

extension NSMutableAttributedString {
//    @discardableResult
//    func font(font: UIFont, range rng: NSRange? = nil) -> NSMutableAttributedString {
//        let range = rng == nil ? (string as NSString).range(of: string) : rng!
//        self.addAttributes([NSAttributedString.Key.font: font], range: range)
//        return self
//    }
//
//
//    @discardableResult
//    func textColor(color: UIColor, range rng: NSRange? = nil) -> NSMutableAttributedString {
//        let range = rng == nil ? (string as NSString).range(of: string) : rng!
//        self.addAttributes([NSAttributedString.Key.foregroundColor: color], range: range)
//        return self
//    }
//
//
//    @discardableResult
//    func paragraph(style: (() -> NSParagraphStyle), range rng: NSRange? = nil) -> NSMutableAttributedString {
//        let range = rng == nil ? (string as NSString).range(of: string) : rng!
//        self.addAttributes([NSAttributedString.Key.paragraphStyle: style()], range: range)
//        return self
//    }
//
//
//    @discardableResult
//    func backgroundColor(color: UIColor, range rng: NSRange? = nil) -> NSMutableAttributedString {
//        let range = rng == nil ? (string as NSString).range(of: string) : rng!
//        self.addAttributes([NSAttributedString.Key.backgroundColor: color], range: range)
//        return self
//    }
//
//
//    @discardableResult
//    func strikeThrough(excludeWhiteSpace: Bool = false) -> NSMutableAttributedString {
//        for (index, item) in self.string.enumerated() {
//
//            guard item.description != " " || !excludeWhiteSpace else {
//                let spaceRange = NSRange(location: index, length: 1)
//                let style = 0
//                self.addAttributes([NSAttributedString.Key.strikethroughStyle: style], range: spaceRange)
//                continue
//            }
//
//            let spaceRange = NSRange(location: index, length: 1)
//            let style = NSUnderlineStyle.single.rawValue
//            self.addAttributes([NSAttributedString.Key.strikethroughStyle: style], range: spaceRange)
//        }
//
//        return self
//    }

    func clearStyleOnSpace() -> NSMutableAttributedString {
        var range = (string as NSString).range(of: string)

        let rawArray = self.string.components(separatedBy: " ")
        let attributes = self.attributes(at: 0, effectiveRange: &range)

        let mutableString = NSMutableAttributedString()

        for item in rawArray {
            var text = item
            if mutableString.string != "" {
                text = " \(text)"
            }

            let current = NSAttributedString(string: text, attributes: attributes)
            mutableString.append(current)
        }

        return mutableString
    }


    @discardableResult
    func baselineOffset(_ offset: Int, range rng: NSRange? = nil) -> NSMutableAttributedString {
        let range = rng == nil ? (string as NSString).range(of: string) : rng!
        self.addAttributes([NSAttributedString.Key.baselineOffset: NSNumber(value: offset)], range: range)
        return self
    }


    @discardableResult
    func link(_ link: String, range rng: NSRange? = nil) -> NSMutableAttributedString {
        let range = rng == nil ? (string as NSString).range(of: string) : rng!
        self.addAttributes([NSAttributedString.Key.link: link], range: range)
        return self
    }


//    @discardableResult
//    func underline(range rng: NSRange? = nil) -> NSMutableAttributedString {
//        let range = rng == nil ? (string as NSString).range(of: string) : rng!
//        self.addAttributes([NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue], range: range)
//        return self
//    }
//
//
//    @discardableResult
//    func lineSpace(_ space: CGFloat) -> NSMutableAttributedString {
//        self.paragraph(style: { () -> NSParagraphStyle in
//            let paragraphStyle = NSMutableParagraphStyle()
//            paragraphStyle.lineSpacing = space
//            return paragraphStyle
//        })
//        return self
//    }
}
