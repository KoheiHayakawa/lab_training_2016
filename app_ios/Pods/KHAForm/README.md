# KHAForm

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)

###CocoaPods
~~~
platform :ios, '9.0'
use_frameworks!

pod 'KHAForm'
~~~

###Requirements
* iOS 9.0
* Xcode 7.0
* Swift 2.0

###Interface
<img alt="demo" src="https://raw.githubusercontent.com/wiki/KoheiHayakawa/KHAForm/images/demo.gif" width="200"/>

<img alt="Screen Shot 01" src="https://raw.githubusercontent.com/wiki/KoheiHayakawa/KHAForm/images/screen_shot_01.png" width="200"/>
<img alt="Screen Shot 02" src="https://raw.githubusercontent.com/wiki/KoheiHayakawa/KHAForm/images/screen_shot_02.png" width="200"/>
<img alt="Screen Shot 03" src="https://raw.githubusercontent.com/wiki/KoheiHayakawa/KHAForm/images/screen_shot_03.png" width="200"/>

###Usage
```swift
import UIKit
import KHAForm // Import KHAForm


// Inherit KHAFormViewController

class ExampleFormViewController: KHAFormViewController {
    
    // Override a method to determine form structure
    override func formCellsInForm(form: KHAFormViewController) -> [[KHAFormCell]] {
        
        // setup cells
        let cell1 = KHAFormCell.formCellWithType(.TextField) // We can init form cell with type.
        let cell2 = dequeueReusableFormCellWithType(.SegmentedControl) // But it's better to dequeue.
        let cell3 = dequeueReusableFormCellWithType(.Switch)
        let cell4 = dequeueReusableFormCellWithType(.Date)
        let cell5 = dequeueReusableFormCellWithType(.Date)
        let cell6 = dequeueReusableFormCellWithType(.Selection)
        let cell7 = dequeueReusableFormCellWithType(.Selection)
        let cell8 = dequeueReusableFormCellWithType(.TextView)
        let cell9 = dequeueReusableFormCellWithType(.Button)
        let cell10 = dequeueReusableFormCellWithType(.Button)
        let cell11 = KHAFormCell()   // we can use custom cell
        
        // settings for each cell
        cell1.textField.text = "Title"
        cell1.textField.placeholder = "placeholder"
        cell1.textField.clearButtonMode = UITextFieldViewMode.Always
        
        cell2.segmentedControl.setTitle("First", forSegmentAtIndex: 0)
        cell2.segmentedControl.setTitle("Second", forSegmentAtIndex: 1)
        cell2.segmentedControl.insertSegmentWithTitle("Third", atIndex: 2, animated: false) // Add segment
        
        cell4.textLabel?.text = "Start"
        cell4.date = NSDate()

        cell5.textLabel?.text = "End"
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        dateFormatter.timeStyle = .NoStyle
        cell5.dateFormatter = dateFormatter // We can change date format
        cell5.datePickerMode = .Date        // and picker mode
        cell5.date = NSDate()
        
        cell6.textLabel?.text = "Fruits"
        let fruitsSelectionFormViewController = KHASelectionFormViewController()
        fruitsSelectionFormViewController.title = "Fruits"
        fruitsSelectionFormViewController.selections = ["None", "Apple", "Grape", "Orange"] // We must init selection list
        fruitsSelectionFormViewController.selectedIndex = 1 // We must assign initial selected value
        cell6.selectionFormViewController = fruitsSelectionFormViewController
    
        cell7.textLabel?.text = "Phone"
        let phoneSelectionFormViewController = PhoneSelectionFormViewController() // We can use custom controller
        cell7.selectionFormViewController = phoneSelectionFormViewController
        
        cell8.textView.placeholder = "placeholder" // We can add placeholder on textview
        
        cell9.button.setTitle("Delete", forState: .Normal)
        cell9.button.setTitleColor(UIColor.redColor(), forState: .Normal)
        cell9.button.addTarget(self, action: Selector("didPressedDeleteButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        cell10.button.setTitle("Cancel", forState: .Normal)
        cell10.button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        cell10.button.addTarget(self, action: Selector("didPressedCancelButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        cell11.textLabel?.text = "custom cell"
        
        // Form structure is determined by using two-dimensional array.
        // First index determines section and second index determines row.
        return [[cell1, cell2, cell3], [cell4, cell5], [cell6, cell7], [cell8], [cell9, cell10], [cell11]]
    }
    
    func didPressedDeleteButton(sender: UIButton) {
        print("delete")
        
        // We can access to the first cell contains text field...
        let cell1 = formCellForIndexPath(NSIndexPath(forRow: 0, inSection: 0))
        print(cell1.textField.text)
        
        // ...and second cell contains segmented controller, etc...
        let cell2 = formCellForIndexPath(NSIndexPath(forRow: 1, inSection: 0))
        print(cell2.segmentedControl.selectedSegmentIndex)
        
        let cell3 = formCellForIndexPath(NSIndexPath(forRow: 2, inSection: 0))
        print(cell3.sswitch.on)
        
        let cell4 = formCellForIndexPath(NSIndexPath(forRow: 0, inSection: 1))
        print(cell4.date)
        
        let cell6 = formCellForIndexPath(NSIndexPath(forRow: 0, inSection: 2))
        print(cell6.selections[cell6.selectedIndex])
    }
    
    func didPressedCancelButton(sender: UIButton) {
        print("cancel")
    }

}
```

If we use custom selection form view controller, this is an example code below.
```swift
import UIKit
import KHAForm

// Inherit KHASelectionFormViewController

class PhoneSelectionFormViewController: KHASelectionFormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Phone"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func selectionsForSelectionForm(selectionForm: KHASelectionFormViewController) -> [String] {
        return ["iPhone 6", "iPhone 6 Plus", "iPhone 5s"]
    }
    
    override func selectedIndexForSelectionForm(selectionForm: KHASelectionFormViewController) -> Int {
        return 0
    }
}
```

###Contact
[@pettarou2](https://twitter.com/pettarou2)

###License
KHAForm is released under the MIT license. See LICENSE for details.
