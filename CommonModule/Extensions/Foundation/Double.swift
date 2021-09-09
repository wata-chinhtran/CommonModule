
import UIKit

extension Double {
    func displayAmountWithCurrency(_ currencySymbol: String, fractionDigitNumber: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.decimalSeparator = "."
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = fractionDigitNumber
        numberFormatter.minimumFractionDigits = fractionDigitNumber
        numberFormatter.currencySymbol = currencySymbol
        if let result = numberFormatter.string(for: self){
            return result
        }
        return ""
    }
}
