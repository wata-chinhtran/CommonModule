
import UIKit

extension NSObject {

    class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    var className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    
    /// Name of object class in string.
    ///
    /// - Returns: Class name in string.
    class func identifier() -> String {
        return String(describing: self)
    }

}
