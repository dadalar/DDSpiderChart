//
//  DrawableString.swift
//  Pods
//
//  Created by Deniz Adalar on 01/05/2017.
//
//

import Foundation

public protocol DrawableString {

    func size() -> CGSize
    func drawDrawable(with rect: CGRect)

}

extension NSString: DrawableString {

    public func drawDrawable(with rect: CGRect) {
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = .byClipping
        style.alignment = .center

        draw(with: rect, options: .usesLineFragmentOrigin, attributes: [NSParagraphStyleAttributeName: style], context: nil)
    }

    public func size() -> CGSize {
        return size(attributes: nil)
    }

}

extension String: DrawableString {

    public func drawDrawable(with rect: CGRect) {
        (self as NSString).drawDrawable(with: rect)
    }

    public func size() -> CGSize {
        return (self as NSString).size()
    }

}

extension NSAttributedString: DrawableString {

    public func drawDrawable(with rect: CGRect) {        
        draw(with: rect, options: .usesLineFragmentOrigin, context: nil)
    }

}
