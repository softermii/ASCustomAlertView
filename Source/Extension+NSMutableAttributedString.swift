//
//  Extension+NSMutableAttributedString.swift
//  CustomAlertController
//
//  Created by Anton Stremovskiy on 8/14/17.
//  Copyright © 2017 áSoft. All rights reserved.
//

import Foundation
import UIKit


public extension NSMutableAttributedString {
    
    public class func h1(string str: String?, textColor: UIColor = UIColor.asDarkGreyBlue, paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle.center) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: str ?? "", attributes: [NSFontAttributeName: UIFont.h1Font(), NSForegroundColorAttributeName: textColor, NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public class func b1(string str: String?, textColor: UIColor = UIColor.asCoolBlueTwo, paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle.center) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: str ?? "", attributes: [NSFontAttributeName: UIFont.h1Font(), NSForegroundColorAttributeName: textColor, NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public class func b2(string str: String?, textColor: UIColor = .white, paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle.center) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: str ?? "", attributes: [NSFontAttributeName: UIFont.h1Font(), NSForegroundColorAttributeName: textColor, NSParagraphStyleAttributeName: paragraphStyle])
    }

    public class func p1(string str: String?, textColor: UIColor = .lightGray, paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle.left) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: str ?? "", attributes: [NSFontAttributeName: UIFont.p1Font(), NSForegroundColorAttributeName: textColor, NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    
    public class func m1(string str: String?, textColor: UIColor = UIColor.asDarkGreyBlue, paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle.center) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: str ?? "", attributes: [NSFontAttributeName: UIFont.m1Font(), NSForegroundColorAttributeName: textColor, NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public class func m2(string str: String?, textColor: UIColor = UIColor.asDarkGreyBlue, paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle.center) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: str ?? "", attributes: [NSFontAttributeName: UIFont.m2Font(), NSForegroundColorAttributeName: textColor, NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public class func m3(string str: String?, textColor: UIColor = UIColor.red, paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle.left) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: str ?? "", attributes: [NSFontAttributeName: UIFont.m3Font(), NSForegroundColorAttributeName: textColor, NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public class func button(string str: String?, textColor: UIColor = UIColor.asCoolBlueTwo, paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle.center) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: str ?? "", attributes: [NSFontAttributeName: UIFont.h1Font(), NSForegroundColorAttributeName: textColor, NSParagraphStyleAttributeName: paragraphStyle])
    }
    
}


public extension NSMutableParagraphStyle {
    
    static public var center: NSMutableParagraphStyle {
        let p = NSMutableParagraphStyle()
        p.alignment = .center
        return p
    }
    
    static public var left: NSMutableParagraphStyle {
        let p = NSMutableParagraphStyle()
        p.alignment = .left
        return p
    }
    
    static public var justified: NSMutableParagraphStyle {
        let p = NSMutableParagraphStyle()
        p.alignment = .justified
        return p
    }
    
    static public var right: NSMutableParagraphStyle {
        let p = NSMutableParagraphStyle()
        p.alignment = .right
        return p
    }
    
}



public extension UIFont {
    public class func m1Font() -> UIFont       { return UIFont.systemFont(ofSize: 14, weight: UIFontWeightMedium) }
    public class func m2Font() -> UIFont       { return UIFont.systemFont(ofSize: 14, weight: UIFontWeightLight)   }
    public class func m3Font() -> UIFont       { return UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular) }
    public class func h1Font() -> UIFont       { return UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular)   }
    public class func p1Font() -> UIFont       { return UIFont.systemFont(ofSize: 13, weight: UIFontWeightThin)   }
}
