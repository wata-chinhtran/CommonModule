

import UIKit

extension UITableView {
    func nextTextFieldInSection(indexPath: IndexPath) -> UITextField? {
        let totalRows = numberOfRows(inSection: indexPath.section)
        if totalRows == indexPath.item + 1 { return nil }
        guard let cell = cellForRow(at: IndexPath(item: indexPath.item + 1, section: indexPath.section)) else {
            return nil
        }

        return findTextField(for: cell).first
    }

    private func findTextField(for view: UIView) -> [UITextField] {
        var textFields = [UITextField]()
        for sub in view.subviews {
            if let tf = sub as? UITextField, tf.isUserInteractionEnabled && tf.isEnabled {
                textFields.append(tf)
            }
            textFields.append(contentsOf: findTextField(for: sub))
        }

        return textFields
    }

    /// Return an blank view with height = 0.01.
    static var emptyView: UIView {
        return UIView(frame: CGRect(x: 0, y: 0, width: 0.0, height: 0.01))
    }

}

extension UITableViewCell {

    /// Return a blank cell.
    static var empty: UITableViewCell {
        return UITableViewCell()
    }
}
