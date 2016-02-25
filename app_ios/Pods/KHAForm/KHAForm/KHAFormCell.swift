//
//  KHAFormCell.swift
//  KHAForm
//
//  Created by Kohei Hayakawa on 3/10/15.
//  Copyright (c) 2015 Kohei Hayakawa. All rights reserved.
//

import UIKit

public enum KHAFormCellType {
    
    case TextField
    case SegmentedControl
    case Switch
    case Date
    case DatePicker
    case TextView
    case Button
    case Selection
    
    func cellID() -> String {
        switch self {
        case .TextField:        return KHATextFieldFormCell.cellID
        case .SegmentedControl: return KHASegmentedControlFormCell.cellID
        case .Switch:           return KHASwitchFormCell.cellID
        case .Date:             return KHADateFormCell.cellID
        case .DatePicker:       return KHADatePickerFormCell.cellID
        case .TextView:         return KHATextViewFormCell.cellID
        case .Button:           return KHAButtonFormCell.cellID
        case .Selection:        return KHASelectionFormCell.cellID
        }
    }
    
    func cellClass() -> AnyClass {
        switch self {
        case .TextField:        return KHATextFieldFormCell.self
        case .SegmentedControl: return KHASegmentedControlFormCell.self
        case .Switch:           return KHASwitchFormCell.self
        case .Date:             return KHADateFormCell.self
        case .DatePicker:       return KHADatePickerFormCell.self
        case .TextView:         return KHATextViewFormCell.self
        case .Button:           return KHAButtonFormCell.self
        case .Selection:        return KHASelectionFormCell.self
        }
    }
}

public class KHAFormCell: UITableViewCell {

    public let button: UIButton = UIButton()
    public var date: NSDate = NSDate()
    public var dateFormatter = NSDateFormatter()
    public var datePickerMode = UIDatePickerMode.DateAndTime
    public let datePicker: UIDatePicker = UIDatePicker()
    public var segmentedControl: UISegmentedControl = UISegmentedControl()
    public let sswitch: UISwitch = UISwitch()
    public let textField: UITextField = UITextField()
    public let textView: UIPlaceholderTextView = UIPlaceholderTextView()
    public var selectionFormViewController = KHASelectionFormViewController()
    
    // MARK: How can I implement class cluster at init?
    // The comment outed code below doesn't work.
    
//    public convenience init(type: KHAFormCellType) {
//        self.init()
//        
//        var subClass: AnyClass
//        switch type {
//        case .TextField:
//            subClass = KHATextFieldFormCell.self
//        case .SegmentedControl:
//            subClass = KHASegmentedControlFormCell.self
//        case .Switch:
//            subClass = KHASwitchFormCell.self
//        case .Date:
//            subClass = KHADateFormCell.self
//        case .DatePicker:
//            subClass = KHADatePickerFormCell.self
//        case .TextView:
//            subClass = KHATextViewFormCell.self
//        case .Button:
//            subClass = KHAButtonFormCell.self
//        }
//        object_setClass(self, subClass)
//    }

    
    public class func formCellWithType(type: KHAFormCellType) -> KHAFormCell {
        switch type {
        case .TextField:
            return KHATextFieldFormCell()
        case .SegmentedControl:
            return KHASegmentedControlFormCell()
        case .Switch:
            return KHASwitchFormCell()
        case .Date:
            return KHADateFormCell()
        case .DatePicker:
            return KHADatePickerFormCell()
        case .TextView:
            return KHATextViewFormCell()
        case .Button:
            return KHAButtonFormCell()
        case .Selection:
            return KHASelectionFormCell()
        }
    }
}
