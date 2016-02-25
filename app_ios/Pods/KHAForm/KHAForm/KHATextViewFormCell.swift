//
//  KHATextViewCell.swift
//  KHAForm
//
//  Created by Kohei Hayakawa on 3/8/15.
//  Copyright (c) 2015 Kohei Hayakawa. All rights reserved.
//

import UIKit

class KHATextViewFormCell: KHAFormCell {
    
    class var cellID: String {
        return "KHATextViewCell"
    }
    
    private let kCellHeight: CGFloat = 144
    private let kFontSize: CGFloat = 16
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .None
        frame = CGRect(
            x: frame.origin.x,
            y: frame.origin.y,
            width: frame.width,
            height: kCellHeight)
        contentView.addSubview(textView)
        textView.font = UIFont.systemFontOfSize(kFontSize)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        // TODO: Fix constant value of left and right.
        // Current value is optimized for iPhone 6.
        // I don't have any good solution for this problem...
        contentView.addConstraints([
            NSLayoutConstraint(
                item: textView,
                attribute: .Left,
                relatedBy: .Equal,
                toItem: contentView,
                attribute: .Left,
                multiplier: 1,
                constant: 10),
            NSLayoutConstraint(
                item: textView,
                attribute: .Right,
                relatedBy: .Equal,
                toItem: contentView,
                attribute: .Right,
                multiplier: 1,
                constant: -5),
            NSLayoutConstraint(
                item: textView,
                attribute: .Height,
                relatedBy: .Equal,
                toItem: nil,
                attribute: .NotAnAttribute,
                multiplier: 1,
                constant: kCellHeight)]
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


public class UIPlaceholderTextView: UITextView {
    
    lazy var placeholderLabel:UILabel = UILabel()
    var placeholderColor:UIColor      = UIColor.lightGrayColor()
    public var placeholder:NSString   = ""
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override public func drawRect(rect: CGRect) {

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textChanged:", name: UITextViewTextDidChangeNotification, object: nil)
        
        if(self.placeholder.length > 0) {
            self.placeholderLabel.frame           = CGRectMake(4,8,self.bounds.size.width - 16,0)
            self.placeholderLabel.lineBreakMode   = NSLineBreakMode.ByWordWrapping
            self.placeholderLabel.numberOfLines   = 0
            self.placeholderLabel.font            = self.font
            self.placeholderLabel.backgroundColor = UIColor.clearColor()
            self.placeholderLabel.textColor       = self.placeholderColor
            self.placeholderLabel.alpha           = 0
            self.placeholderLabel.tag             = 999            
            self.placeholderLabel.text = self.placeholder as String
            self.placeholderLabel.sizeToFit()
            self.addSubview(placeholderLabel)
        }
        self.sendSubviewToBack(placeholderLabel)
        
        if(self.text.characters.count == 0 && self.placeholder.length > 0){
            self.viewWithTag(999)?.alpha = 1
        }
        super.drawRect(rect)
    }
    
    internal func textChanged(notification:NSNotification?) -> (Void) {
        if(self.placeholder.length == 0){
            return
        }
        if(self.text.characters.count == 0) {
            self.viewWithTag(999)?.alpha = 1
        }else{
            self.viewWithTag(999)?.alpha = 0
        }
    }
}