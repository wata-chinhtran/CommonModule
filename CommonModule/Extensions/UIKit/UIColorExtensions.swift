//
//  UIColorExtensions.swift
//  SwifterSwift
//
//  Created by Max Haertwig on 10/06/19.
//  Copyright © 2019 SwifterSwift
//

#if canImport(UIKit)
import UIKit

public extension UIColor {

    #if !os(watchOS)
    /// SwifterSwift: Create a UIColor with different colors for light and dark mode.
    ///
    /// - Parameters:
    ///     - light: Color to use in light/unspecified mode.
    ///     - dark: Color to use in dark mode.
    @available(iOS 13.0, tvOS 13.0, *)
    convenience init(light: UIColor, dark: UIColor) {
        self.init(dynamicProvider: { $0.userInterfaceStyle == .dark ? dark : light })
    }
    #endif

}

#endif


class ColorManager {
    private init(){}
    static fileprivate(set) var shared: ColorManager = ColorManager()
    
    var white: UIColor { return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) }
    
    var nameTitle: UIColor { return UIColor.black }
    
    /// Hex: 0DAE64
    var main: UIColor { return #colorLiteral(red: 0.05098039216, green: 0.6823529412, blue: 0.3921568627, alpha: 1) }
    
    /// Hex: FFA900
    var secondary1: UIColor { return #colorLiteral(red: 1, green: 0.662745098, blue: 0, alpha: 1) }
    
    /// Hex: FE585A
    var secondary2: UIColor { return #colorLiteral(red: 0.9960784314, green: 0.3450980392, blue: 0.3529411765, alpha: 1) }
    
    /// Hex: 007AFF
   
    var tabbarviewBackgroud: UIColor { return #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1) }
    var backgroudViewContent: UIColor { return #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1) }
    
    var button: UIColor { return #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1) }
    var buttonSecondary: UIColor { return #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1) }
    var uilabel: UIColor { return #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1) }
     /// Hex: ECECEC
     var backgroud_Email_Pass: UIColor { return #colorLiteral(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00) }

    /// Hex: 2E3038
    var title: UIColor { return #colorLiteral(red: 0.1803921569, green: 0.1882352941, blue: 0.2196078431, alpha: 1) }
    
    /// Hex: 7C7C7C
    var subTitle: UIColor { return #colorLiteral(red: 0.4862745098, green: 0.4862745098, blue: 0.4862745098, alpha: 1) }
    
    /// Hex: 9F9F9F
    var inactive: UIColor { return #colorLiteral(red: 0.6235294118, green: 0.6235294118, blue: 0.6235294118, alpha: 1) }
    
    /// Hex: 292929
    var barTitle: UIColor { return #colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1607843137, alpha: 1) }
    
    var tabbarIconPressTitle: UIColor { return #colorLiteral(red: 0.05098039216, green: 0.6823529412, blue: 0.3921568627, alpha: 1) }
    var tabbarIconDisableTitle: UIColor { return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.35) }
    
    /// Hex: F3F3F3
    var separator: UIColor { return #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1) }
    
    var textArticleDetail: UIColor { return UIColor.black }
    var hyperlinkColor: UIColor { return #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) }
    var entityTitleColor: UIColor { return #colorLiteral(red: 0.2470588235, green: 0.2666666667, blue: 0.3294117647, alpha: 1) }
    var tintColorBufferSlider: UIColor { return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) }
    var disableColorBufferSlider: UIColor { return #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) }
    var placeHolderTextFieldTextColor: UIColor { return #colorLiteral(red: 0.3137254902, green: 0.3137254902, blue: 0.3137254902, alpha: 0.8) }
//    var backgroundColorFullVideo: UIColor { return #colorLiteral(red: 0.1019607843, green: 0.1019607843, blue: 0.1019607843, alpha: 1) }
    var backgroundColorFullVideo: UIColor { return UIColor.black }

    /// Hex: CFCFCF
    var buttonDisable: UIColor { return #colorLiteral(red: 0.8117647059, green: 0.8117647059, blue: 0.8117647059, alpha: 1) }
    var reportNormal: UIColor { return #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1) }
    var reportSelected: UIColor { return #colorLiteral(red: 0.8980392157, green: 0.9607843137, blue: 0.9333333333, alpha: 1) }
    var placeholder: UIColor { return UIColor(red: 229.0, green: 229.0, blue: 234.0, alpha: 1.0) }
    
    /// Hex: F2F3F5
    var backgroundTextField: UIColor { return #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.9607843137, alpha: 1) }
    
    /// Hex: F5F6F9
    var searchTextFieldBackground: UIColor { return #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9764705882, alpha: 1) }
    
    var onboardingBackground: UIColor { return #colorLiteral(red: 0.968627451, green: 0.9803921569, blue: 0.9725490196, alpha: 1) }
//    var tabbarviewBackgroud: UIColor { return #colorLiteral(red: 0.1161440238, green: 0.6093356013, blue: 1, alpha: 1) }
    
    var label: UIColor { return #colorLiteral(red: 0.1647058824, green: 0.1647058824, blue: 0.1647058824, alpha: 1) }

    /// Hex: EAEAEA
    var spaceGray: UIColor { return #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1) }
    
    /// Hex: 171E23
    var labelColor: UIColor { return #colorLiteral(red: 0.09019607843, green: 0.1176470588, blue: 0.137254902, alpha: 1) }
    
    var chatSenderBubbleBackground: UIColor { return #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.9176470588, alpha: 1) }
    var chatReceiverBubbleBackground: UIColor { return #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1) }

    var backgroundTexField: UIColor { return #colorLiteral(red: 0.2549019608, green: 0.6039215686, blue: 0.9882352941, alpha: 1) }
    
    var popupText: UIColor {return #colorLiteral(red: 0, green: 0.462745098, blue: 1, alpha: 1) }
    
    var blue_text_color: UIColor { return #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1) }
    var gray_text_color: UIColor { return #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1) }
    
    var vehicleYear: UIColor {return #colorLiteral(red: 0.4117647059, green: 0.4117647059, blue: 0.4117647059, alpha: 1)}
    
    var buttonDone: UIColor {return #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)}
    
    var borderColor: UIColor {return #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)}
    
    /// Hex: 000000 with alpha: 6
    var transparentBackground: UIColor { return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6) }
    
    /// Hex: 2A2A2A
    var color_2A2A2A: UIColor { return #colorLiteral(red: 0.1647058824, green: 0.1647058824, blue: 0.1647058824, alpha: 0.6) }
    var dragedLine: UIColor { return #colorLiteral(red: 0.1647058824, green: 0.1647058824, blue: 0.1647058824, alpha: 1) }
    var labelSearch: UIColor { return #colorLiteral(red: 0.1647058824, green: 0.1647058824, blue: 0.1647058824, alpha: 1) }
    var shadownView: UIColor { return #colorLiteral(red: 0.1647058824, green: 0.1647058824, blue: 0.1647058824, alpha: 1) }
    
    var color_A2A2A2: UIColor { return #colorLiteral(red: 0.1647058824, green: 0.1647058824, blue: 0.1647058824, alpha: 1) }
    
    /// Hex: C6C6C8
    var anotherSepraratorLine: UIColor { return #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1) }
    
    /// Hex: C8C8C8
    var separatorLine: UIColor { return #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 0.6) }
    
    var disabledBg: UIColor { return #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1) }
    
    var startBGGradientColor: UIColor { return #colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9921568627, alpha: 1) }
    var endBGGradientColor: UIColor { return #colorLiteral(red: 0.9960784314, green: 1, blue: 1, alpha: 1) }
    
    // Hex:AAAAAA
    var dashboardNameDefault: UIColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)

    // Hex: F5F5F5
    var backgroundColor: UIColor = #colorLiteral(red: 0.9688121676, green: 0.9688346982, blue: 0.9688225389, alpha: 1)

    /// Hex: 979797
    var grayColor: UIColor { return #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1) }
    
    // Hex: 006A00
    var invoiceColor: UIColor { return #colorLiteral(red: 0, green: 0.4156862745, blue: 0, alpha: 1)}
    
    // Hex: 6A3699
    var estimateColor: UIColor { return #colorLiteral(red: 0.4156862745, green: 0.2117647059, blue: 0.6, alpha: 1)}
    // Hex: 696969
    var checklistDesc: UIColor = #colorLiteral(red: 0.4117647059, green: 0.4117647059, blue: 0.4117647059, alpha: 1)
    
    func color(hexString: String) -> UIColor {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

let sColorMgr = ColorManager.shared


enum ThemeColor: String, CaseIterable {
    
    case Shadow_Black // = "Shadow Black - G1"
    case Blue_Jean //= "Blue Jeans - N1"
    case Lighting_Blue // = "Lighting Blue - N6"
    case Stone_Gray // = "Stone Gray - D1"
    case Guard // = "Guard - HN"
    case Magnectic // = "Magnectic - J7"
    case Lead_Foot // = "Lead Foot - JX"
    case Magma_Red1 // = "Magma Red - E1"
    case Race_Red // "Race Red -PQ"
    case Magma_Red2 // = "Magma Red - E2"
    case White // = " "
    case Custom // = " "
    case unknowed
    
    var displaySubTitle: String {
        switch self {
        case .Shadow_Black:
            return "Shadow Black - G1"
        case .Blue_Jean:
            return "Blue Jeans - N1"
        case .Lighting_Blue:
            return "Lighting Blue - N6"
        case .Stone_Gray:
            return "Stone Gray - D1"
        case .Guard:
            return "Guard - HN"
        case .Magnectic:
            return "Magnectic - J7"
        case .Lead_Foot:
            return "Lead Foot - JX"
        case .Magma_Red1:
            return "Magma Red - E1"
        case .Race_Red:
            return "Race Red -PQ"
        case .Magma_Red2:
            return "Magma Red - E2"
        case .White:
            return ""
        case .Custom:
            return ""
        case .unknowed:
            return ""
        }
    }
    
    var displayTitle: String{
        switch self {
        case .Shadow_Black:
            return "Black"
        case .Blue_Jean:
            return "Blue"
        case .Lighting_Blue:
            return "Blue"
        case .Stone_Gray:
            return "Gray"
        case .Guard:
            return "Gray"
        case .Magnectic:
            return "Gray"
        case .Lead_Foot:
            return "Gray"
        case .Magma_Red1:
            return "Red"
        case .Race_Red:
            return "Red"
        case .Magma_Red2:
            return "Red"
        case .White:
            return "White"
        case .Custom:
            return "Custom"
        case .unknowed:
            return ""
        }
    }
    
    var hexColorCode: String {
        switch self {
        case .Shadow_Black:
            return "#121212"
        case .Blue_Jean:
            return "#062737"
        case .Lighting_Blue:
            return "#0A3A8B"
        case .Stone_Gray:
            return "#9C9B96"
        case .Guard:
            return "#232D2F"
        case .Magnectic:
            return "#2C2D2E"
        case .Lead_Foot:
            return "#3C4249"
        case .Magma_Red1:
            return "#1E1519"
        case .Race_Red:
            return "#C91E22"
        case .Magma_Red2:
            return "#681117"
        case .White:
            return "#FFFFFF"
        case .Custom:
            return "#FFFFFF"
        case .unknowed:
            return ""
        }
    }
    
}

class ThemeManager {
    static let shared = ThemeManager()
    
    let themeInvoie = "#006A00"
    let themeEstimate = "#693598"
    let themeNotApprove = "#6C6C6C"
    let themeApprove = "#28A038"
    let themeClosed = "#929292"
    let themeInvoiceInprogress = "#fd9400"
}
