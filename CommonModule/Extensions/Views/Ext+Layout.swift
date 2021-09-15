

import UIKit


extension UIScrollView {
    
    open override var description: String {
        return "v_\(self.hashValue)"
    }
}

extension UITableView {
    
    open override var description: String {
        return "v_\(self.hashValue)"
    }
}

extension UICollectionView {
    
    open override var description: String {
        return "v_\(self.hashValue)"
    }
}

extension UIView {
    
    open override var description: String {
        return "v_\(self.hashValue)"
    }
    
    
    /**
     Add constraint by visual format.
     
     - Parameter visualFormat: Format of constraint.
     - Parameter views: Related views.
     */
    @discardableResult
    func constraints(_ views: [String: UIView], _ visualFormat: String) -> [NSLayoutConstraint] {
        let format = visualFormat.replacingOccurrences(of: " - (null)", with: "")
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: format,
                                                         options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                         metrics: nil,
                                                         views: views)
        constraints.forEach({ $0.priority = UILayoutPriority(rawValue: 999) })
        self.addConstraints(constraints)
        return constraints
    }
    
    
    
    /**
     Add constraint by multiple visual format.
     
     - Parameter visualFormats: Formats of constraints.
     */
    @discardableResult
    func constraints(_ format: String) -> [NSLayoutConstraint] {
        let mappedSubviews = self.mappedSubviews()
        return self.constraints(mappedSubviews, format)
    }
    
    func constraints(_ visualFormats: String...) {
        let mappedSubviews = self.mappedSubviews()
        visualFormats.forEach { format in
            self.constraints(mappedSubviews, format)
        }
    }
    
    
    
    /**
     Generated key/value from subviews.
     
     - Returns: Mapped key/value from subviews.
     */
    func mappedSubviews() -> [String: UIView] {
        var mappedViews = [String: UIView]()
        for view in self.subviews {
            mappedViews[view.description] = view
        }
        return mappedViews
    }
    
    /**
     Add constraints to all 4 side.
     */
    func constraintsFit(_ views: UIView..., top: CGFloat = 0, left: CGFloat = 0, bot: CGFloat = 0, right: CGFloat = 0) {
        for view in views {
            self.constraints(["view": view], "V:|-(\(top))-[view]-(\(bot))-|")
            self.constraints(["view": view], "H:|-(\(left))-[view]-(\(right))-|")
        }
    }
    
    /**
     Add horizontal constraints to left & right.
     */
    func constraintsH(_ views: UIView..., left: CGFloat = 0, right: CGFloat = 0) {
        for view in views {
            self.constraints(["view": view], "H:|-(\(left))-[view]-(\(right))-|")
        }
    }
    
    func constraintsH(_ views: UIView..., padding: CGFloat = 0) {
        for view in views {
            self.constraints(["view": view], "H:|-(\(padding))-[view]-(\(padding))-|")
        }
    }

    /**
     Add vertical constraints to top & bottom.
     */
    func constraintsV(_ views: UIView..., top: CGFloat = 0, bot: CGFloat = 0) {
        for view in views {
            self.constraints(["view": view], "V:|-(\(top))-[view]-(\(bot))-|")
        }
    }
    
    func constraintsV(_ views: UIView..., padding: CGFloat = 0) {
        for view in views {
            self.constraints(["view": view], "V:|-(\(padding))-[view]-(\(padding))-|")
        }
    }
    
    
    /**
     Create and add constraint.
     
     - Parameter layout: Layout.
     - Parameter priority: Priority of constraint.
     
     - Returns: Created constraint.
     */
    @discardableResult
    func constraint(_ item: UIView, _ layout: ViewLayout, priority: Float = 999) -> NSLayoutConstraint {
        let attribute = layout.attribute
        let constant = layout.constant
        
        var retval: NSLayoutConstraint
        switch attribute {
        case .width, .height:
            retval = NSLayoutConstraint(item: item, attribute: attribute, relatedBy: layout.relation, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: constant)
            retval.priority = UILayoutPriority(rawValue: priority)
            
            item.addConstraint(retval)
            
            
        default:
            retval = NSLayoutConstraint(item: item, attribute: attribute, relatedBy: layout.relation, toItem: self, attribute: attribute, multiplier: 1, constant: constant)
            retval.priority = UILayoutPriority(rawValue: priority)
            
            self.addConstraint(retval)
        }
        return retval
    }
    
    
    /**
     Create and add constraints.
     
     - Parameter layout: Layouts.
     */
    func constraints(_ item: UIView, _ layouts: ViewLayout...) {
        layouts.forEach { self.constraint(item, $0) }
    }


    /// add constraint
    ///
    /// - Parameters:
    ///   - attribute1: <#attribute1 description#>
    ///   - item2: <#item2 description#>
    ///   - layout: <#layout description#>
    ///   - multiplier: <#multiplier description#>
    ///   - priority: <#priority description#>
    @discardableResult
    func constraint(_ layout: ViewLayout, _ item2: Any?, _ attribute2: NSLayoutConstraint.Attribute? = nil, multiplier: CGFloat = 1, priority: Int = 999) -> NSLayoutConstraint {
        let attr2 = item2 != nil && attribute2 == nil ? layout.attribute : attribute2 ?? .notAnAttribute
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: layout.attribute,
                                            relatedBy: layout.relation,
                                            toItem: item2,
                                            attribute: attr2,
                                            multiplier: multiplier,
                                            constant: layout.constant)
        constraint.priority = UILayoutPriority(rawValue: Float(priority))

        if item2 != nil {
            // constraint is added to container view
            guard let containView = self.superview else { fatalError("this view is not attached tree views") }
            containView.addConstraint(constraint)

        } else {
            self.addConstraint(constraint)
        }

        return constraint
    }
}


// MARK: -

struct ViewLayout {
    var attribute: NSLayoutConstraint.Attribute
    var constant: CGFloat
    var relation: NSLayoutConstraint.Relation
}


// MARK: -

func ==(left: NSLayoutConstraint.Attribute, right: CGFloat) -> ViewLayout {
    var value = right
    if left == .bottom || left == .right {
        value *= -1
    }
    return ViewLayout(attribute: left, constant: value, relation: .equal)
}

func <=(left: NSLayoutConstraint.Attribute, right: CGFloat) -> ViewLayout {
    var value = right
    if left == .bottom || left == .right {
        value *= -1
    }
    return ViewLayout(attribute: left, constant: value, relation: .lessThanOrEqual)
}

func >=(left: NSLayoutConstraint.Attribute, right: CGFloat) -> ViewLayout {
    var value = right
    if left == .bottom || left == .right {
        value *= -1
    }
    return ViewLayout(attribute: left, constant: value, relation: .greaterThanOrEqual)
}
