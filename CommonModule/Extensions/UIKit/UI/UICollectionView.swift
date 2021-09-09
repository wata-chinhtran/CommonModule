
import UIKit

extension UICollectionView {
    func register(_ nibName: String, reuseIdentifier: String = "") {
        var identifier = reuseIdentifier
        if identifier.isEmpty {
            identifier = nibName
        }
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: identifier)
    }
}
