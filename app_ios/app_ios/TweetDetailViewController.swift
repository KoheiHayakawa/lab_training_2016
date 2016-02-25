//
//  TweetDetailViewController.swift
//  app_ios
//
//  Created by Kohei Hayakawa on 1/27/16.
//  Copyright © 2016 Kohei Hayakawa. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {

    var tweet: Tweet?
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var bodyTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let tweet = self.tweet {
            titleTextLabel.text = tweet.title
            bodyTextLabel.text = tweet.body
        }
        
        // Navigation BarにEditボタンを追加
        let editButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "didTouchEditBarButton:")
        navigationItem.rightBarButtonItem = editButton
    }
    
    // MARK: - Bar button action selector
    
    // Editボタンが押された時に編集フォームを表示
    func didTouchEditBarButton(sender: UIBarButtonItem) {
        let tweetUpdateForm = TweetUpdateFormController()
        tweetUpdateForm.tweet = self.tweet
        let navigationController = UINavigationController(rootViewController: tweetUpdateForm)
        presentViewController(navigationController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
