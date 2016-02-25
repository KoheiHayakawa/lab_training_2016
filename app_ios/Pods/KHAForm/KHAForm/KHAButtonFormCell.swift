//
//  KHAButtonCell.swift
//  KHAForm
//
//  Created by Kohei Hayakawa on 3/8/15.
//  Copyright (c) 2015 Kohei Hayakawa. All rights reserved.
//

import UIKit

class KHAButtonFormCell: KHAFormCell {
    
    class var cellID: String {
        return "KHAButtonCell"
    }
    
    private let kFontSize: CGFloat = 15
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .None
        
        button.setTitle("Button", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(kFontSize)
        button.titleLabel?.textAlignment = .Center
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)

        contentView.addConstraints([
            NSLayoutConstraint(
                item: button,
                attribute: .Left,
                relatedBy: .Equal,
                toItem: contentView,
                attribute: .Left,
                multiplier: 1,
                constant: 0),
            NSLayoutConstraint(
                item: button,
                attribute: .Right,
                relatedBy: .Equal,
                toItem: contentView,
                attribute: .Right,
                multiplier: 1,
                constant: 0),
            NSLayoutConstraint(
                item: button,
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
