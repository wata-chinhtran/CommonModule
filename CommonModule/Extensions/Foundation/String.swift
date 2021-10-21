
import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
//    func height(withConstrainedWidth width: CGFloat, font: UIFont, numOfLine: Int = 0) -> CGFloat {
//       let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
//       label.numberOfLines = numOfLine
//       label.text = self
//       label.font = font
//       label.sizeToFit()
//
//       return label.frame.height
//    }
    
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
//
//    func widthOfString(usingFont font: UIFont) -> CGFloat {
//        let fontAttributes = [NSAttributedString.Key.font: font]
//        let size = self.size(withAttributes: fontAttributes)
//        return size.width
//    }
}

//@IBDesignable
//class InsetLabel: UILabel {
//
//    @IBInspectable var topInset: CGFloat = 4.0
//    @IBInspectable var leftInset: CGFloat = 4.0
//    @IBInspectable var bottomInset: CGFloat = 4.0
//    @IBInspectable var rightInset: CGFloat = 4.0
//
//    var insets: UIEdgeInsets {
//        get {
//            return UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
//        }
//        set {
//            topInset = newValue.top
//            leftInset = newValue.left
//            bottomInset = newValue.bottom
//            rightInset = newValue.right
//        }
//    }
//
//    override func sizeThatFits(_ size: CGSize) -> CGSize {
//        var adjSize = super.sizeThatFits(size)
//        adjSize.width += leftInset + rightInset
//        adjSize.height += topInset + bottomInset
//        return adjSize
//    }
//
//    override var intrinsicContentSize: CGSize {
//        let systemContentSize = super.intrinsicContentSize
//        let adjustSize = CGSize(width: systemContentSize.width + leftInset + rightInset, height: systemContentSize.height + topInset +  bottomInset)
//        if adjustSize.width > preferredMaxLayoutWidth && preferredMaxLayoutWidth != 0 {
//            let constraintSize = CGSize(width: bounds.width - (leftInset + rightInset), height: .greatestFiniteMagnitude)
//            let newSize = super.sizeThatFits(constraintSize)
//            return CGSize(width: systemContentSize.width, height: ceil(newSize.height) + topInset + bottomInset)
//        } else {
//            return adjustSize
//        }
//    }
//
//    override func drawText(in rect: CGRect) {
//        super.drawText(in: rect.inset(by: insets))
//    }
//}

extension String {
    var attributed: NSMutableAttributedString {
        return NSMutableAttributedString(string: self)
    }


    /// Validates email format
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }


    /// Validates number
    var isNumber: Bool {
        let numberCharacters = CharacterSet.decimalDigits.inverted
        return !self.isEmpty && self.rangeOfCharacter(from: numberCharacters) == nil
    }


    var isInstantBook: Bool {
        return self == "instant_book"
    }


    var clearedControlCharacters: String {
        let regex = try? NSRegularExpression(pattern: "(\\p{Cc})", options: [.caseInsensitive])
        return regex?.stringByReplacingMatches(in: self,
                                               range: NSRange(location: 0, length: self.count),
                                               withTemplate: " ")
            .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) ?? self
    }


    /// Extracts number
    var numberCharacters: String {
        let regex = try? NSRegularExpression(pattern: "[^0-9\\s]", options: [.caseInsensitive])
        return regex?.stringByReplacingMatches(in: self,
                                               range: NSRange(location: 0, length: self.count),
                                               withTemplate: " ")
            .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) ?? self
    }

    /// Converts string to phone number format
    var phoneNumber: String {
        let numberRegex = try? NSRegularExpression(pattern: "[^0-9\\s]", options: [.caseInsensitive])
        let number = numberRegex?.stringByReplacingMatches(in: self,
                                                           range: NSRange(location: 0, length: self.count),
                                                           withTemplate: " ")
            .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        guard number != nil else { return self }

        let phoneRegex = try? NSRegularExpression(pattern: "^([0]*)", options: [.caseInsensitive])
        let phone = phoneRegex?.stringByReplacingMatches(in: number!,
                                                         range: NSRange(location: 0, length: number!.count),
                                                         withTemplate: "")
        return phone ?? self
    }


    /// Validates phone number format
    var isPhoneNumber: Bool {
        let phoneRegEx = "^[+]?(?:[0-9] ?){6,14}[0-9]$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        return predicate.evaluate(with: self)
    }


//    func lsImageUrl(preferredWidth: CGFloat) -> String {
//        let encodedUrlString = self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? self
//        var components = URLComponents(string: encodedUrlString)
//        components?.query = "w=\(Int(preferredWidth))&fit=crop"
//
//        guard let url = components?.url else {
//            return self
//        }
//        return url.absoluteString
//    }


//    /// Convert HTML to attributed string
//    func decodeHtmlToAttributedString(minimumFontSize: CGFloat? = nil) -> NSMutableAttributedString? {
//        guard let stringData = self.data(using: .utf8) else { return nil }
//        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
//            .documentType: NSAttributedString.DocumentType.html.rawValue,
//            .characterEncoding: String.Encoding.utf8.rawValue
//        ]
//        var decodedAttributedString = try? NSMutableAttributedString(data: stringData, options: options, documentAttributes: nil)
//        if let mutableAttributedString = decodedAttributedString?.mutableCopy() as? NSMutableAttributedString {
//            // change font to local
//            mutableAttributedString.beginEditing()
//            let range = NSRange(location: 0, length: mutableAttributedString.length)
//            mutableAttributedString.enumerateAttribute(NSAttributedString.Key.font, in: range, options: []) { (value, range, stop) in
//                guard let oldFont = value as? UIFont else { return }
//
//                // remove attributed of old font
//                mutableAttributedString.removeAttribute(NSAttributedString.Key.font, range: range)
//
//                // replace with new attributed of new font
//                let localFont: UIFont
//                let fontSize = max(minimumFontSize ?? 0, oldFont.pointSize)
//                if oldFont.fontName == "TimesNewRomanPSMT" {
//                    localFont = UIFont.typeface(fontSize, style: .regular)
//
//                } else if oldFont.fontName == "TimesNewRomanPS-BoldMT" {
//                    localFont = UIFont.typeface(fontSize, style: .bold)
//
//                } else if oldFont.fontName == "TimesNewRomanPS-ItalicMT" {
//                    localFont = UIFont.typeface(fontSize, style: .light)
//
//                } else if oldFont.fontName == "TimesNewRomanPS-BoldItalicMT" {
//                    localFont = UIFont.typeface(fontSize, style: .medium)
//
//                } else {
//                    localFont = UIFont.typeface(fontSize, style: .regular)
//                }
//                mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: localFont, range: range)
//            }
//            decodedAttributedString = mutableAttributedString
//        }
//        return decodedAttributedString
//    }


//    /// Converts HTML to plain text
//    func decodeHTML() -> String {
//        return decodeHtmlToAttributedString()?.string ?? self
//    }


    /// Converts date to string with specific format
    func convertDate(fromFormat from: String, toFormat to: String) -> String {
        let fromFormatter = DateFormatter()
        fromFormatter.dateFormat = from
        let toFormatter = DateFormatter()
        toFormatter.dateFormat = to
        guard let date = fromFormatter.date(from: self) else { return "" }
        return toFormatter.string(from: date)
    }


    /// Converts string to date
    func date(withFormat format: String, locale: Locale = Locale.current, timezone: TimeZone? = nil) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = format
        if let tz = timezone {
            formatter.timeZone = tz
        }
        return formatter.date(from: self)
    }


    func isIn<T: RawRepresentable> (_ list: [T], ignoreCase: Bool = false) -> Bool  where T.RawValue == String {
        if ignoreCase {
            return list.map { $0.rawValue.lowercased() }.contains(self.lowercased())
        }
        return list.map { $0.rawValue }.contains(self)
    }


//    func sizeWith(font: UIFont) -> CGSize {
//        let str = self as NSString
//        return str.size(withAttributes: [NSAttributedString.Key.font: font])
//    }


    /// Compares versions
    func compareVersion(_ another: String) -> ComparisonResult {
        return self.compare(another, options: .numeric)
    }


    /// Compares URL
    func containsURL(_ link: String) -> Bool {
        guard let url = URL(string: self), let url2 = URL(string: link) else { return false }

        // compare host
        guard let host1 = url.host, let host2 = url2.host, host1 == host2 else { return false }

        // compare path
        let path1 = url.path
        let path2 = url2.path
        guard path1.hasPrefix(path2) else { return false }

        // compare queries
        let query1 = url.query ?? ""
        let query2 = url2.query ?? ""
        guard query2.count != 0 else { return true }
        guard path1 == path2 else { return false }

        // compare number parameters
        let params1 = query1.components(separatedBy: "&")
        let params2 = query2.components(separatedBy: "&")
        guard params1.count >= params2.count else {
            return false
        }
        return params2.filter { !params1.contains($0) }.count == 0
    }


    func validateRange(_ range: NSRange) -> Bool {
        return self.count > range.location && self.count >= (range.location + range.length)
    }


    /// Removes characters
    func remove(_ characters: [String]) -> String {
        var temp = self
        characters.forEach {
            temp = temp.replacingOccurrences(of: $0, with: "")
        }
        return temp
    }


    /// Makes length string to groups.
    /// Ex: 1111222233334444 ->  1111 2222 3333 4444 (group length is 4 and separator is white space)
    func group(lengthPerGroup length: Int, separator: String) -> String {
        var startIndex = self.startIndex
        var results = [Substring]()

        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }

        let groups = results.map { String($0) }
        return groups.joined(separator: separator)
    }
    
    /**
     Return a trimmed string.
     */
    func strip() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    
    var double: Double {
        return Double(self) ?? 0
    }
    
//    var cgFloat: CGFloat {
//        return Double(self)?.cgFloat ?? 0
//    }
//
//    var int: Int {
//        return Int(self) ?? 0
//    }
//
//    var bool: Bool? {
//        switch self.lowercased() {
//        case "true", "t", "yes", "y", "1":
//            return true
//
//        case "false", "f", "no", "n", "0":
//            return false
//
//        default:
//            return nil
//        }
//    }
}


func + (left: String?, right: String) -> String {
    return (left ?? "") + right
}

func + (left: String, right: String?) -> String {
    return left + (right ?? "")
}



// Since all optionals are actual enum values in Swift, we can easily
// extend them for certain types, to add our own convenience APIs

extension String {
    
    var isNilOrEmpty: Bool {
        return self.isEmpty
    }
}

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        switch self {
        case let string?:
            return string.isEmpty
        case nil:
            return true
        }
    }
}
