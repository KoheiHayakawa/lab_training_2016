//
//  NewTweetFormController.swift
//  app_ios
//
//  Created by Kohei Hayakawa on 2/3/16.
//  Copyright © 2016 Kohei Hayakawa. All rights reserved.
//

import UIKit
import KHAForm // ライブラリをインポート

class TweetCreateFormController: KHAFormViewController {
    
    override func formCellsInForm(form: KHAFormViewController) -> [[KHAFormCell]] {
        
        let cell1 = KHAFormCell.formCellWithType(.TextField) // titleを入力するTextField
        let cell2 = KHAFormCell.formCellWithType(.TextView)  // bodyを入力するTextView
        let cell3 = KHAFormCell.formCellWithType(.Button)    // 投稿ボタン
        
        cell3.button.setTitle("Tweet!", forState: .Normal)
        cell3.button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        cell3.button.addTarget(self, action: Selector("didPressedTweetButton:"), forControlEvents: UIControlEvents.TouchUpInside)

        return [[cell1, cell2], [cell3]]
    }
    
    func didPressedTweetButton(sender: UIButton) {
        
        let cell1 = formCellForIndexPath(NSIndexPath(forRow: 0, inSection: 0))
        let cell2 = formCellForIndexPath(NSIndexPath(forRow: 1, inSection: 0))
        
        let tweet = Tweet(title: cell1.textField.text!, body: cell2.textView.text)
        tweet.createTweet(
            success: {
                print("success create")
            },
            failure: {(error) in
                print("fail create")
            }
        )
        dismissViewControllerAnimated(true, completion: nil)
    }
}
