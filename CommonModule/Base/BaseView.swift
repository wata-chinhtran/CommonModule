
//  Copyright © 2020 Wata Solutions. All rights reserved.
//

import Foundation
import UIKit

public class BaseView: UIView {
    class func instanceFormNib(nibName: String) -> UIView {
        return UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setupView() {
        
    }
}
