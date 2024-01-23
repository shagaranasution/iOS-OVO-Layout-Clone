//
//  Extensions.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 17/01/24.
//

import UIKit

extension UIView {
    
    public var width: CGFloat {
        return self.frame.size.width
    }
    
    public var height: CGFloat {
        return self.frame.size.height
    }
    
    public var top: CGFloat {
        return self.frame.origin.x
    }
    
    public var bottom: CGFloat {
        return top + height
    }
    
    public var left: CGFloat {
        return self.frame.origin.y
    }
    
    public var right: CGFloat {
        return left + width
    }
    
    public func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    public func pin(
        to superview: UIView,
        top: CGFloat = 0,
        left: CGFloat = 0,
        right: CGFloat = 0,
        bottom: CGFloat = 0
    ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: top),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: left),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: right),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom)
        ])
    }
    
    public func pin(
        to superview: UIView,
        horizontal: CGFloat? = nil,
        vertical: CGFloat? = nil
    ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let horizontal = horizontal {
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: horizontal).isActive = true
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -horizontal).isActive = true
        }
        if let vertical = vertical {
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: vertical).isActive = true
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -vertical).isActive = true
        }
    }
    
    public func pin(
        to superview: UIView,
        spacing: CGFloat = 0
    ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: spacing),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: spacing),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -spacing),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -spacing)
        ])
    }
    
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}

extension UIColor {
    public static let ovoBackground = UIColor(r: 255, g: 255, b: 255, a: 1)
    public static let ovoSecondaryBackground = UIColor(r: 240, g: 240, b: 240, a: 1)
    
    public static let purpleOVOMain = UIColor(r: 76, g: 0, b: 126, a: 1)
    public static let purpleOVOMain01 = UIColor(r: 76, g: 0, b: 126, a: 0.1)

    public static let blueSmoked = UIColor(r: 224, g: 229, b: 255, a: 1)
    
    public static let white05 = UIColor(r: 255, g: 255, b: 255, a: 0.5)
}

extension UIImage {
    public static func pixel(ofColor color: UIColor) -> UIImage {
        let pixel = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(pixel.size)
       
        defer {
            UIGraphicsEndImageContext()
        }
        
        guard
            let context = UIGraphicsGetCurrentContext()
        else {
            return UIImage()
        }
        
        context.setFillColor(color.cgColor)
        context.fill(pixel)
        
        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }
}
