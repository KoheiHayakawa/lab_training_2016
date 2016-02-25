//
//  EditTweetFormController.swift
//  app_ios
//
//  Created by Kohei Hayakawa on 2/4/16.
//  Copyright © 2016 Kohei Hayakawa. All rights reserved.
//

import UIKit
import KHAForm

class TweetUpdateFormController: KHAFormViewController {
    
    var tweet: Tweet?
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - KHAForm data source
    
    override func formCellsInForm(form: KHAFormViewController) -> [[KHAFormCell]] {
        
        let cell1 = dequeueReusableFormCellWithType(.TextField)
        let cell2 = dequeueReusableFormCellWithType(.TextView)
        let cell3 = dequeueReusableFormCellWithType(.Button)
        
        cell1.textField.text = tweet?.title
        cell2.textView.text = tweet?.body
        
        cell3.button.setTitle("Done", forState: .Normal)
        cell3.button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        cell3.button.addTarget(self, action: Selector("didTouchDoneButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        return [[cell1, cell2], [cell3]]
    }
    
    
    // MARK: - Bar button action selector
    
    func didTouchDoneButton(sender: UIBarButtonItem) {

        let cell1 = formCellForIndexPath(NSIndexPath(forRow: 0, inSection: 0))
        let cell2 = formCellForIndexPath(NSIndexPath(forRow: 1, inSection: 0))
        
        tweet?.title = cell1.textField.text
        tweet?.body = cell2.textView.text
        
        tweet?.updateTweet(
            success: {
                print("success update")
            },
            failure: {error in
                print("fail update")
            }
        )
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
