//
//  KHATextFieldCell.swift
//  KHAForm
//
//  Created by Kohei Hayakawa on 3/8/15.
//  Copyright (c) 2015 Kohei Hayakawa. All rights reserved.
//

import UIKit

class KHATextFieldFormCell: KHAFormCell {
    
    class var cellID: String {
        return "KHATextFieldCell"
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .None

        textField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textField)
        
        // TODO: Fix constant value of left and right. 
        // Current value is optimized for iPhone 6.
        // I don't have any good solution for this problem...
        contentView.addConstraints([
            NSLayoutConstraint(
                item: textField,
                attribute: .Left,
                relatedBy: .Equal,
                toItem: contentView,
                attribute: .Left,
                multiplier: 1,
                constant: 15),
            NSLayoutConstraint(
                item: textField,
                attribute: .Right,
                relatedBy: .Equal,
                toItem: contentView,
                attribute: .Right,
                multiplier: 1,
                constant: -10),
            NSLayoutConstraint(
                item: textField,
                attribute: .Height,
                relatedBy: .Equal,
                toItem: nil,
                attribute: .NotAnAttribute,
                multiplier: 1,
                constant: 44)]
        )
    }    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}