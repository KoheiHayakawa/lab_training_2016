//
//  KHADateCell.swift
//  KHAForm
//
//  Created by Kohei Hayakawa on 3/8/15.
//  Copyright (c) 2015 Kohei Hayakawa. All rights reserved.
//

import UIKit

class KHADateFormCell: KHAFormCell {
    
    class var cellID: String {
        return "KHADateCell"
    }
    
    override var date: NSDate {
        willSet {
            detailTextLabel?.text = dateFormatter.stringFromDate(newValue)
        }
    }
    
    override var dateFormatter: NSDateFormatter {
        willSet {
            detailTextLabel?.text = newValue.stringFromDate(date)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Value1, reuseIdentifier: reuseIdentifier)
        textLabel?.text = "Label"
        detailTextLabel?.text = "Date"
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .ShortStyle
        datePickerMode = .DateAndTime
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}