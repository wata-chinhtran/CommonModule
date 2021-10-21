

import UIKit

//class BaseTableViewController: BaseViewController {
//
//    // MARK: Properties
//
//    lazy var tableView: UITableView = {
//        return UITableView(frame: CGRect.zero, style: self.tableViewStyle)
//    }()
//    fileprivate var cellHeights = [IndexPath: CGFloat]()
//
//
//    // MARK: Life cycles
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.setupTableView()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(self.keyboardWillShow(notification:)),
//            name: NSNotification.Name.UIKeyboardWillShow,
//            object: nil
//        )
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(self.keyboardWillHide(notification:)),
//            name: NSNotification.Name.UIKeyboardWillHide,
//            object: nil
//        )
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//    }
//
//    deinit {
//        self.tableView.delegate = nil
//        self.tableView.dataSource = nil
//    }
//}


// MARK: - Setup

//extension BaseTableViewController {
//
//    @objc func setupTableView() {
//        self.tableView.backgroundColor = .white
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        self.tableView.separatorStyle = .none
//        self.tableView.rowHeight = UITableViewAutomaticDimension
//
//        // Header/footer view
//        if self.tableViewStyle == .grouped {
//            self.tableView.tableHeaderView = UITableView.emptyView
//            self.tableView.tableFooterView = UITableView.emptyView
//        } else {
//            self.tableView.tableFooterView = UIView()
//        }
//    }
//
//    @objc var tableViewStyle: UITableView.Style {
//        return .grouped
//    }
//}


// MARK: - Selector methods

//extension BaseTableViewController {
//
//    @objc func keyboardWillShow(notification: Notification) {
//        view.layoutIfNeeded()
//        guard
//            let userInfo = notification.userInfo,
//            let kbValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue
//            else { return }
//
//        self.tableView.contentInset.bottom = kbValue.cgRectValue.height
//        self.tableView.scrollIndicatorInsets = self.tableView.contentInset
//    }
//
//    @objc func keyboardWillHide(notification: Notification) {
//        self.tableView.contentInset.bottom = 0
//        self.tableView.scrollIndicatorInsets = self.tableView.contentInset
//    }
//}


// MARK: - UITableViewDelegate + UITableViewDataSource

//extension BaseTableViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 0.01
//    }
//    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0.01
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return self.cellHeights[indexPath] ?? UITableViewAutomaticDimension
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return nil
//    }
//    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return nil
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return .empty
//    }
//    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        self.cellHeights[indexPath] = cell.bounds.height
//        if let c = cell as? BaseTableViewCell {
//            c.row = indexPath.row
//            c.section = indexPath.section
//            c.lastRowInSection = tableView.numberOfRows(inSection: indexPath.section) == indexPath.row + 1
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
//}
