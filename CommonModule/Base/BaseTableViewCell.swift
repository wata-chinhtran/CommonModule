

import UIKit

public class BaseTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    // Public
    var row: Int = 0
    var section: Int = 0
    var firstRowInSection: Bool {
        return self.row == 0
    }
    var lastRowInSection = false
    var indexPath: IndexPath {
        return IndexPath(row: self.row, section: self.section)
    }
    
    // Private
    fileprivate weak var topLineLayer: CALayer?
    fileprivate weak var bottomLineLayer: CALayer?
    
    
    // MARK: Setup
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        // Draw line layer if needed
        if self.shouldDrawBottomLine && self.bottomLineLayer == nil {
            
            let bottomLineLayer = CALayer()
            //bottomLineLayer.backgroundColor = self.botLineColor.cgColor
            self.layer.addSublayer(bottomLineLayer)
            self.bottomLineLayer = bottomLineLayer
        }
        
        // Draw top line layer if needed
        if self.shouldDrawTopLine && self.topLineLayer == nil {
            
            let topLineLayer = CALayer()
            //topLineLayer.backgroundColor = self.topLineColor.cgColor
            self.layer.addSublayer(topLineLayer)
            self.topLineLayer = topLineLayer
        }
    }
    
 public override func layoutSubviews() {
        super.layoutSubviews()
        self.updateLines()
    }
    
    
    // MARK: Line attributes
    
//    var topLineColor: UIColor {
//        return .separatorLine
//    }
//    
//    var botLineColor: UIColor {
//        return .separatorLine
//    }
    
    func updateLines() {
        self.bottomLineLayer?.frame = self.bottomLineFrame
        self.topLineLayer?.frame = self.topLineFrame
        self.topLineLayer?.opacity = self.shouldDrawTopLine && self.firstRowInSection ? 1 : 0
        
        // Send line to front
        if let bottomLine = self.bottomLineLayer {
            bottomLine.removeFromSuperlayer()
            self.layer.insertSublayer(bottomLine, at: UInt32(self.layer.sublayers?.count ?? 0))
        }
        
        if let topLine = self.topLineLayer {
            topLine.removeFromSuperlayer()
            self.layer.insertSublayer(topLine, at: UInt32(self.layer.sublayers?.count ?? 0))
        }
    }
    
    
    // MARK: Top line attributes
    
    var shouldDrawTopLine: Bool {
        return false
    }
    
    func redrawTopLine() {
        if self.topLineLayer == nil {
            let topLineLayer = CALayer()
            topLineLayer.opacity = 0
            //topLineLayer.backgroundColor = self.topLineColor.cgColor
            self.layer.addSublayer(topLineLayer)
            self.topLineLayer = topLineLayer
        }
    }
    
    var topLineFrame: CGRect {
        let paddings = self.topLinePaddings
        return CGRect(
            x: paddings.left,
            y: 0,
            width: self.bounds.width - paddings.left - paddings.right,
            height: 1
        )
    }
    
    var topLinePaddings: (left: CGFloat, right: CGFloat) {
        return (0, 0)
    }
    
    // MARK: Bottom line attributes
    
    var shouldDrawBottomLine: Bool {
        return true
    }
    
    var bottomLineFrame: CGRect {
        let paddings = self.bottomLinePaddings
        return CGRect(
            x: paddings.left,
            y: self.bounds.height - 1,
            width: self.bounds.width - paddings.left - paddings.right,
            height: 1
        )
    }
    
    var bottomLinePaddings: (left: CGFloat, right: CGFloat) {
        return (0, 0)
    }
    
    func hideBottomLine(_ hide: Bool) {
        self.bottomLineLayer?.opacity = hide ? 0 : 1
    }

}
