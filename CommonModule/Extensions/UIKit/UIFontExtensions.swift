//
//  UIFontExtensions.swift
//  SwifterSwift
//
//  Created by Benjamin Meyer on 9/16/17.
//  Copyright © 2017 SwifterSwift
//

#if canImport(UIKit)
import UIKit

// MARK: - Properties
public extension UIFont {

    /// SwifterSwift: Font as bold font
    var bold: UIFont {
        return UIFont(descriptor: fontDescriptor.withSymbolicTraits(.traitBold)!, size: 0)
    }

    /// SwifterSwift: Font as italic font
    var italic: UIFont {
        return UIFont(descriptor: fontDescriptor.withSymbolicTraits(.traitItalic)!, size: 0)
    }

    /// SwifterSwift: Font as monospaced font
    ///
    ///     UIFont.preferredFont(forTextStyle: .body).monospaced
    ///
    var monospaced: UIFont {
        let settings = [[UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType, UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector]]

        let attributes = [UIFontDescriptor.AttributeName.featureSettings: settings]
        let newDescriptor = fontDescriptor.addingAttributes(attributes)
        return UIFont(descriptor: newDescriptor, size: 0)
    }

}

#endif



// MARK: - Protocol
/**************************************--PROTOCOL--***************************************
 *****************************************************************************************/
protocol CiaoFont {
    func boldItalic(_ size: CGFloat) -> UIFont
    func bold(_ size: CGFloat) -> UIFont
    func italic(_ size: CGFloat) -> UIFont
    func regular(_ size: CGFloat) -> UIFont
    func semiBold(_ size: CGFloat) -> UIFont
    func semiBoldItalic(_ size: CGFloat) -> UIFont
    func mediumItalic(_ size: CGFloat) -> UIFont
    func medium(_ size: CGFloat) -> UIFont
    func light(_ size: CGFloat) -> UIFont
    func lightItalic(_ size: CGFloat) -> UIFont
    func extraBold(_ size: CGFloat) -> UIFont
    func extraBoldItalic(_ size: CGFloat) -> UIFont
}

extension CiaoFont {
    func boldItalic(_ size: CGFloat) -> UIFont              { return UIFont.systemFont(ofSize: size) }
    func bold(_ size: CGFloat) -> UIFont                    { return UIFont.systemFont(ofSize: size) }
    func italic(_ size: CGFloat) -> UIFont                  { return UIFont.systemFont(ofSize: size) }
    func regular(_ size: CGFloat) -> UIFont                 { return UIFont.systemFont(ofSize: size) }
    func semiBold(_ size: CGFloat) -> UIFont                { return UIFont.systemFont(ofSize: size) }
    func semiBoldItalic(_ size: CGFloat) -> UIFont          { return UIFont.systemFont(ofSize: size) }
    func mediumItalic(_ size: CGFloat) -> UIFont            { return UIFont.systemFont(ofSize: size) }
    func medium(_ size: CGFloat) -> UIFont                  { return UIFont.systemFont(ofSize: size) }
    func light(_ size: CGFloat) -> UIFont                   { return UIFont.systemFont(ofSize: size) }
    func lightItalic(_ size: CGFloat) -> UIFont             { return UIFont.systemFont(ofSize: size) }
    func extraBold(_ size: CGFloat) -> UIFont               { return UIFont.systemFont(ofSize: size) }
    func extraBoldItalic(_ size: CGFloat) -> UIFont         { return UIFont.systemFont(ofSize: size) }
}
/*****************************************************************************************
 *****************************************************************************************/


// MARK: - All CiaoFont types

struct CabinFont: CiaoFont {
    func boldItalic(_ size: CGFloat) -> UIFont {      return UIFont(name: "Cabin-BoldItalic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func bold(_ size: CGFloat) -> UIFont {            return UIFont(name: "Cabin-Bold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func italic(_ size: CGFloat) -> UIFont {          return UIFont(name: "Cabin-Italic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func regular(_ size: CGFloat) -> UIFont {         return UIFont(name: "Cabin-Regular", size: size) ?? UIFont.systemFont(ofSize: size) }
    func semiBold(_ size: CGFloat) -> UIFont {        return UIFont(name: "Cabin-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func semiBoldItalic(_ size: CGFloat) -> UIFont {  return UIFont(name: "Cabin-SemiBoldItalic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func mediumItalic(_ size: CGFloat) -> UIFont {    return UIFont(name: "Cabin-MediumItalic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func medium(_ size: CGFloat) -> UIFont {          return UIFont(name: "Cabin-Medium", size: size) ?? UIFont.systemFont(ofSize: size) }
}

struct RobotoFont: CiaoFont {
    func boldItalic(_ size: CGFloat) -> UIFont {      return UIFont(name: "Roboto-BoldItalic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func bold(_ size: CGFloat) -> UIFont {            return UIFont(name: "Roboto-Bold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func italic(_ size: CGFloat) -> UIFont {          return UIFont(name: "Roboto-Italic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func regular(_ size: CGFloat) -> UIFont {         return UIFont(name: "Roboto-Regular", size: size) ?? UIFont.systemFont(ofSize: size) }
    func semiBold(_ size: CGFloat) -> UIFont {        return UIFont(name: "Roboto-Bold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func semiBoldItalic(_ size: CGFloat) -> UIFont {  return UIFont(name: "Roboto-BoldItalic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func mediumItalic(_ size: CGFloat) -> UIFont {    return UIFont(name: "Roboto-MediumItalic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func medium(_ size: CGFloat) -> UIFont {          return UIFont(name: "Roboto-Medium", size: size) ?? UIFont.systemFont(ofSize: size) }
    func light(_ size: CGFloat) -> UIFont {           return UIFont(name: "Roboto-Light", size: size) ?? UIFont.systemFont(ofSize: size) }
}

struct IBMPlexSerifFont: CiaoFont {
    func regular(_ size: CGFloat) -> UIFont {         return UIFont(name: "IBMPlexSerif", size: size) ?? UIFont.systemFont(ofSize: size) }
    func bold(_ size: CGFloat) -> UIFont {            return UIFont(name: "IBMPlexSerif-Bold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func italic(_ size: CGFloat) -> UIFont {          return UIFont(name: "IBMPlexSerif-Italic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func medium(_ size: CGFloat) -> UIFont {          return UIFont(name: "IBMPlexSerif-Medium", size: size) ?? UIFont.systemFont(ofSize: size) }
    
}

struct SFCompactFont {
    
     func regular(_ size: CGFloat) -> UIFont {         return UIFont(name: "SFCompactText-Regular", size: size) ?? UIFont.systemFont(ofSize: size) }
     func light(_ size: CGFloat) -> UIFont {           return UIFont(name: "SFCompactText-Light", size: size) ?? UIFont.systemFont(ofSize: size) }
    
}

struct NotoSerifFont: CiaoFont {
    func regular(_ size: CGFloat) -> UIFont {         return UIFont(name: "NotoSerif", size: size) ?? UIFont.systemFont(ofSize: size) }
    func bold(_ size: CGFloat) -> UIFont {            return UIFont(name: "NotoSerif-Bold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func italic(_ size: CGFloat) -> UIFont {          return UIFont(name: "NotoSerif-Italic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func boldItalic(_ size: CGFloat) -> UIFont {          return UIFont(name: "NotoSerif-BoldItalic", size: size) ?? UIFont.systemFont(ofSize: size) }
}

struct InterfFont: CiaoFont {
    func regular(_ size: CGFloat) -> UIFont {         return UIFont(name: "Inter-Regular", size: size) ?? UIFont.systemFont(ofSize: size) }
    func bold(_ size: CGFloat) -> UIFont {            return UIFont(name: "Inter-Bold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func italic(_ size: CGFloat) -> UIFont {          return UIFont(name: "Inter-Italic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func medium(_ size: CGFloat) -> UIFont {          return UIFont(name: "Inter-Medium", size: size) ?? UIFont.systemFont(ofSize: size) }
    func semiBold(_ size: CGFloat) -> UIFont {          return UIFont(name: "Inter-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func black(_ size: CGFloat) -> UIFont {         return UIFont(name: "Inter-Black", size: size) ?? UIFont.systemFont(ofSize: size) }
    func extraBold(_ size: CGFloat) -> UIFont {            return UIFont(name: "Inter-ExtraBold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func lightBETA(_ size: CGFloat) -> UIFont {          return UIFont(name: "Inter-Light-BETA", size: size) ?? UIFont.systemFont(ofSize: size) }
}

struct BarlowFont: CiaoFont {
    func boldItalic(_ size: CGFloat) -> UIFont {      return UIFont(name: "Barlow-BoldItalic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func bold(_ size: CGFloat) -> UIFont {            return UIFont(name: "Barlow-Bold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func italic(_ size: CGFloat) -> UIFont {          return UIFont(name: "Barlow-Italic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func regular(_ size: CGFloat) -> UIFont {         return UIFont(name: "Barlow-Regular", size: size) ?? UIFont.systemFont(ofSize: size) }
    func semiBold(_ size: CGFloat) -> UIFont {        return UIFont(name: "Barlow-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func semiBoldItalic(_ size: CGFloat) -> UIFont {  return UIFont(name: "Barlow-SemiBoldItalic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func mediumItalic(_ size: CGFloat) -> UIFont {    return UIFont(name: "Barlow-MediumItalic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func medium(_ size: CGFloat) -> UIFont {          return UIFont(name: "Barlow-Medium", size: size) ?? UIFont.systemFont(ofSize: size) }
    func light(_ size: CGFloat) -> UIFont {           return UIFont(name: "Barlow-Light", size: size) ?? UIFont.systemFont(ofSize: size) }
    func lightItalic(_ size: CGFloat) -> UIFont {     return UIFont(name: "Barlow-LightItalic", size: size) ?? UIFont.systemFont(ofSize: size) }
    func extraBold(_ size: CGFloat) -> UIFont {       return UIFont(name: "Barlow-ExtraBold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func extraBoldItalic(_ size: CGFloat) -> UIFont { return UIFont(name: "Barlow-ExtraBoldItalic", size: size) ?? UIFont.systemFont(ofSize: size) }
}

struct ArialFont: CiaoFont {
    func boldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Arial-BoldItalicMT", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Arial-BoldMT", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    func italic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Arial-ItalicMT", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "ArialMT", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

struct SourceSansPro: CiaoFont {
    func boldItalic(_ size: CGFloat) -> UIFont {       return UIFont(name: "SourceSansPro-BoldIt", size: size) ?? UIFont.systemFont(ofSize: size) }
    func bold(_ size: CGFloat) -> UIFont {             return UIFont(name: "SourceSansPro-Bold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func italic(_ size: CGFloat) -> UIFont {           return UIFont(name: "SourceSansPro-It", size: size) ?? UIFont.systemFont(ofSize: size) }
    func regular(_ size: CGFloat) -> UIFont {          return UIFont(name: "SourceSansPro-Regular", size: size) ?? UIFont.systemFont(ofSize: size) }
    func semiBold(_ size: CGFloat) -> UIFont {         return UIFont(name: "SourceSansPro-Semibold", size: size) ?? UIFont.systemFont(ofSize: size) }
    func semiBoldItalic(_ size: CGFloat) -> UIFont {   return UIFont(name: "SourceSansPro-SemiboldIt", size: size) ?? UIFont.systemFont(ofSize: size) }
    func extraLight(_ size: CGFloat) -> UIFont {       return UIFont(name: "SourceSansPro-ExtraLight", size: size) ?? UIFont.systemFont(ofSize: size) }
    func extraLightIlatic(_ size: CGFloat) -> UIFont { return UIFont(name: "SourceSansPro-ExtraLightIt", size: size) ?? UIFont.systemFont(ofSize: size) }
    func light(_ size: CGFloat) -> UIFont {            return UIFont(name: "SourceSansPro-Light", size: size) ?? UIFont.systemFont(ofSize: size) }
    func lightItalic(_ size: CGFloat) -> UIFont {      return UIFont(name: "SourceSansPro-LightIt", size: size) ?? UIFont.systemFont(ofSize: size) }
    func black(_ size: CGFloat) -> UIFont {            return UIFont(name: "SourceSansPro-Black", size: size) ?? UIFont.systemFont(ofSize: size) }
    func blackItalic(_ size: CGFloat) -> UIFont {      return UIFont(name: "SourceSansPro-BlackIt", size: size) ?? UIFont.systemFont(ofSize: size) }
}
