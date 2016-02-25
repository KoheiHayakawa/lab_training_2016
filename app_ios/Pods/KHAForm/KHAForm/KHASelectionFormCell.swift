//
//  KHASelectionFormCell.swift
//  KHAForm
//
//  Created by Kohei Hayakawa on 5/1/15.
//  Copyright (c) 2015 Kohei Hayakawa. All rights reserved.
//

import UIKit

class KHASelectionFormCell: KHAFormCell {

    class var cellID: String {
        return "KHASelectionCell"
    }
    
    override var selectionFormViewController: KHASelectionFormViewController {
        willSet {
            detailTextLabel?.text = newValue.selections[newValue.selectedIndex]
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Value1, reuseIdentifier: reuseIdentifier)

        textLabel?.text = "Label"
        detailTextLabel?.text = "None"
        accessoryType = .DisclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
