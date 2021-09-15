

import Foundation

extension UICollectionView {
        
    /// Create a collection view with frame = .zero.
    ///
    /// - Parameter layout: Layout of collection view.
    convenience init(layout: UICollectionViewLayout) {
        self.init(frame: .zero, collectionViewLayout: layout)
    }
    
    /// Register table cells or headers/footers by given class.
    ///
    /// - Parameter aClass: UITableViewCell class.
    func register(_ cells: UICollectionViewCell.Type...) {
        for cell in cells {
            self.register(cell, forCellWithReuseIdentifier: cell.className)
        }
    }
    
    /// Register collection header view by given UICollectionReusableView class.
    ///
    /// - Parameter aClass: UICollectionReusableView class.
    func register(headerView aClass: UICollectionReusableView.Type) {
        self.register(aClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: aClass.className)
    }
    
    /// Register collection footer view by given UICollectionReusableView class.
    ///
    /// - Parameter aClass: UICollectionReusableView class.
    func register(footerView aClass: UICollectionReusableView.Type) {
        self.register(aClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: aClass.className)
    }
    
    /// Dequeue cell by given UICollectionViewCell class
    ///
    /// - Parameters:
    ///   - fromClass: UICollectionViewCell class.
    ///   - indexPath: Index path of cell.
    /// - Returns: Dequeued cell.
    func dequeue<T: UICollectionViewCell>(cell fromClass: T.Type, at indexPath: IndexPath) -> T {
        let cell = self.dequeueReusableCell(withReuseIdentifier: fromClass.className, for: indexPath) as! T
        let base = cell as? BaseCollectionCell
        base?.row = indexPath.row
        base?.section = indexPath.section
        base?.lastRowInSection = self.numberOfItems(inSection: indexPath.section) == indexPath.row + 1
        
        return cell
    }
    
    /// Dequeue table header view by given UICollectionReusableView class.
    ///
    /// - Parameter fromClass: UICollectionReusableView class.
    /// - Returns: Dequeued collection header view.
    func dequeue<T: UICollectionReusableView>(headerView fromClass: T.Type, at indexPath: IndexPath) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: fromClass.className, for: indexPath) as! T
    }
    
    /// Dequeue table footer view by given UICollectionReusableView class.
    ///
    /// - Parameter fromClass: UICollectionReusableView class.
    /// - Returns: Dequeued collection footer view.
    func dequeue<T: UICollectionReusableView>(footerView fromClass: T.Type, at indexPath: IndexPath) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: fromClass.className, for: indexPath) as! T
    }
    
    /// Reload section from collection view.
    ///
    /// - Parameters:
    ///   - section: Section to be reloaded.
    ///   - animation: Animation of reloading.
    func reloadSection(_ section: Int) {
        self.reloadSections(IndexSet(integer: section))
    }
    
    /// Reload sections in collection view.
    ///
    /// - Parameters:
    ///   - section: Sections to be reloaded.
    ///   - animation: Animation of reloading.
    func reloadSections(_ sections: [Int]) {
        self.reloadSections(IndexSet(sections))
    }
    
    
    /// Perform reload & callback when finish to get the correct contentSize.
    ///
    /// - Parameter completion: Callback.
    func reloadData(completion: @escaping VoidBlock) {
        self.reloadData()
        dispatch_main {
            completion()
        }
    }
}


// MARK: - UICollectionViewCell

extension UICollectionViewCell {
    
    /// Return a blank cell.
    static var empty: UICollectionViewCell {
        return UICollectionViewCell()
    }
}
