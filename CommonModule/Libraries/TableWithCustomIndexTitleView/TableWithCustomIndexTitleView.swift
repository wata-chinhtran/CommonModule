
import UIKit

public protocol TableWithCustomIndexTitleViewDataSource : NSObjectProtocol {
    func sectionIndexTitles() -> [String]?
    func contentListView(numberOfRowsInSection section: Int) -> Int
    func contentListView(_ listView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func numberOfSections() -> Int
}

public protocol TableWithCustomIndexTitleViewDelegate : NSObjectProtocol {
    func contentListView(heightForRowAt indexPath: IndexPath) -> CGFloat
    func contentListView(didSelectRowAt indexPath: IndexPath)
}

class TableWithCustomIndexTitleView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var indexTitleListView: UICollectionView!
    @IBOutlet weak var contentListView: UITableView!
    @IBOutlet weak var indexTitleViewHeight: NSLayoutConstraint!
    
    private var currentIndexSelected = 0
    private var currentIndexPath = IndexPath(row: 0, section: 0)
    private let heightCellCharacter: CGFloat = 15
    private var lastContentOffset: CGFloat = 0
    
    weak open var dataSource: TableWithCustomIndexTitleViewDataSource?
    weak open var delegate: TableWithCustomIndexTitleViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    private func nibSetup() {
        backgroundColor = .clear
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        contentView.backgroundColor = .clear
        addSubview(contentView)
        commonInit()
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
    
    func commonInit() {
        indexTitleListView.backgroundColor = .clear
        indexTitleListView.register(CharacterCollectionViewCell.reuseIdentifier)
        indexTitleListView.delegate = self
        indexTitleListView.dataSource = self
        
        contentListView.backgroundColor = .clear
        contentListView.delegate = self
        contentListView.dataSource = self
        // add pan gesture for alphabet collectionview
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        indexTitleListView.addGestureRecognizer(panGesture)
    }
    
    func registerCell(_ cellName: String) {
        contentListView.register(cellName)
    }
    
    func reloadData() {
        indexTitleViewHeight.constant = CGFloat(dataSource?.sectionIndexTitles()?.count ?? 0) * heightCellCharacter
        indexTitleListView.reloadData()
        contentListView.reloadData()
    }
    
    @objc func handleSwipe(sender: UIPanGestureRecognizer){
        if sender.state == .changed {
            let touchPoint = sender.location(in: indexTitleListView)
            if let indexPath = indexTitleListView.indexPathForItem(at: touchPoint) {
                let newIndexPath = IndexPath(row: NSNotFound, section: indexPath.item)
                if currentIndexPath != newIndexPath {
                    currentIndexPath = newIndexPath
                    contentListView.scrollToRow(at: newIndexPath, at: .none, animated: true)
                    if let oldCell = indexTitleListView.cellForItem(at: IndexPath(item: currentIndexSelected, section: 0)) as? CharacterCollectionViewCell, let newCell = indexTitleListView.cellForItem(at: indexPath) as? CharacterCollectionViewCell {
                        oldCell.lblCharacter.textColor = .lightGray
                        newCell.lblCharacter.textColor = .darkText
                    }
                    currentIndexSelected = indexPath.item
                }
            }
        }
    }
}

// MARK: - CollectionView
extension TableWithCustomIndexTitleView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.sectionIndexTitles()?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.reuseIdentifier, for: indexPath) as! CharacterCollectionViewCell
        var character = dataSource?.sectionIndexTitles()?[indexPath.item].uppercased()
        if character == "." {
            character = "•"
        }
        cell.lblCharacter.text = character
        cell.backgroundColor = .clear
        if currentIndexSelected == indexPath.item {
            cell.lblCharacter.textColor = .darkText
        } else {
            cell.lblCharacter.textColor = .lightGray
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: CGFloat(heightCellCharacter))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // reset color of list alphabet
        if let oldCell = collectionView.cellForItem(at: IndexPath(item: currentIndexSelected, section: 0)) as? CharacterCollectionViewCell, let newCell = collectionView.cellForItem(at: indexPath) as? CharacterCollectionViewCell {
            oldCell.lblCharacter.textColor = .lightGray
            newCell.lblCharacter.textColor = .darkText
        }
        
        // reset current index
        currentIndexSelected = indexPath.item
        
        // scroll tableview to new index
        let sectionIndexPath = IndexPath(row: NSNotFound, section: indexPath.item)
        contentListView.scrollToRow(at: sectionIndexPath, at: .top, animated: true)
    }
}



extension TableWithCustomIndexTitleView: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.contentListView(numberOfRowsInSection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource?.contentListView(tableView, cellForRowAt: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return delegate?.contentListView(heightForRowAt: indexPath) ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.contentListView(didSelectRowAt: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        reloadFocusedToIndex(scrollView)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        reloadFocusedToIndex(scrollView)
    }
    
    func reloadFocusedToIndex(_ scrollView: UIScrollView) {
        var isDown = false
        if scrollView == contentListView {
            // hanlde animation when scroll tableview
            if (self.lastContentOffset > scrollView.contentOffset.y) {
                // move up
                if let listVisibleIndexPaths = contentListView.indexPathsForVisibleRows, let topIndexPath = listVisibleIndexPaths.first {
                    currentIndexSelected = topIndexPath.section
                    indexTitleListView.reloadData()
                }
                isDown = false
            }
            else if (self.lastContentOffset < scrollView.contentOffset.y) {
                // move down
                if let listVisibleIndexPaths = contentListView.indexPathsForVisibleRows, let bottomIndexPath = listVisibleIndexPaths.last {
                    currentIndexSelected = bottomIndexPath.section
                    indexTitleListView.reloadData()
                }
                isDown = true
            }
        }

        let maxY = scrollView.contentOffset.y + contentListView.frame.size.height
        if isDown && maxY > contentListView.contentSize.height{
            self.lastContentOffset = contentListView.contentSize.height - contentListView.frame.size.height
        }else if !isDown && scrollView.contentOffset.y < 0{
            self.lastContentOffset = 0
        }else{
            // update the new position acquired
            self.lastContentOffset = scrollView.contentOffset.y
        }
    }
}
