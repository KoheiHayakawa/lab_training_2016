//
//  KHADatePickerCell.swift
//  KHAForm
//
//  Created by Kohei Hayakawa on 3/8/15.
//  Copyright (c) 2015 Kohei Hayakawa. All rights reserved.
//

import UIKit

class KHADatePickerFormCell: KHAFormCell {
    
    class var cellID: String {
        return "KHADatePickerCell"
    }
    
    private let kCellHeight: CGFloat = 216
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        frame = CGRect(
            x: frame.origin.x,
            y: frame.origin.y,
            width: frame.width,
            height: kCellHeight)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(datePicker)
        
        contentView.addConstraints([
            NSLayoutConstraint(
                item: datePicker,
                attribute: .Left,
                relatedBy: .Equal,
                toItem: contentView,
                attribute: .Left,
                multiplier: 1,
                constant: 0),
            NSLayoutConstraint(
                item: datePicker,
                attribute: .Right,
                relatedBy: .Equal,
                toItem: contentView,
                attribute: .Right,
                multiplier: 1,
                constant: 0),
            NSLayoutConstraint(
                item: datePicker,
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