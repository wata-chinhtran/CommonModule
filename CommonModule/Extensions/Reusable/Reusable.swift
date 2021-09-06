
import UIKit

protocol Reusable {}

extension Reusable where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    static var reuseIdentifieriPad: String {
        return String(describing: Self.self) + "_iPad"
    }
}

extension UITableViewCell: Reusable {}
extension UICollectionViewCell: Reusable {}

extension UITableViewHeaderFooterView: Reusable {}

public extension IndexPath {
    static var zero: IndexPath {
        return IndexPath(item: 0, section: 0)
    }
}
