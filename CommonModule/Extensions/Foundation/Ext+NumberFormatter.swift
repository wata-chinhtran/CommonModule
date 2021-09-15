

import Foundation

extension NumberFormatter {
    func from(value: Any) -> String {
        guard let number = value as? NSNumber else {
            return ""
        }

        return self.string(from: number) ?? ""
    }
}

extension Double {
    var humanStyle: String {
        guard self.truncatingRemainder(dividingBy: 1) == 0 else {
            return "\(self)"
        }
        return "\(Int(self))"
    }

    func display(fractionDigits fraction: (Int, Int) = (0, 2)) -> String {
        let numberFmt = NumberFormatter()
        numberFmt.numberStyle = .decimal
        numberFmt.minimumFractionDigits = fraction.0
        numberFmt.maximumFractionDigits = fraction.1
        return numberFmt.string(from: NSNumber(value: self)) ?? "\(self)"
    }

    func format(_ f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

extension Float {
    var humanStyle: String {
        guard self.truncatingRemainder(dividingBy: 1) == 0 else {
            return "\(self)"
        }
        return "\(Int(self))"
    }

    func format(_ f: String = "") -> String {
        return String(format: "%\(f)f", self)
    }
}

extension Int {
    func format(_ f: String = "") -> String {
        return String(format: "%\(f)d", self)
    }
}
