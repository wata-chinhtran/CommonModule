

import UIKit

extension UIStoryboard {
    func initViewController<T: UIViewController>() -> T {
        let identifier = String(describing: T.self)
        guard let obj = self.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Can't find any class name with identifier: \(identifier)")
        }
        return obj
    }
}
