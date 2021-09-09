
import UIKit

extension UITableView {
    func register(_ nibName: String, reuseIdentifier: String = "") {
        var identifier = reuseIdentifier
        if identifier.isEmpty {
            identifier = nibName
        }
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterCell(id: String) {
        self.register(UINib(nibName: id, bundle: nil), forHeaderFooterViewReuseIdentifier: id)
    }
}
