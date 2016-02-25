//
//  TweetsViewController.swift
//  app_ios
//
//  Created by Kohei Hayakawa on 1/27/16.
//  Copyright © 2016 Kohei Hayakawa. All rights reserved.
//

import UIKit

class TweetsViewController: UITableViewController {

    // ダミーデータ
    private var tweets:[Tweet] = [Tweet(title: "hoge", body: "hogehoge"),
                                  Tweet(title: "foo", body: "fooooo"),
                                  Tweet(title: "bar", body: "barbar")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Navigation Barに新規投稿ボタンを追加
        let newTweetButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "didTouchNewTweetBarButton:")
        navigationItem.rightBarButtonItem = newTweetButton
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: Selector("onRefresh:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    override func viewWillAppear(animated: Bool) {
        refreshData()
    }
    
    func refreshData() {
        Tweet.getTweets(
            success: {(tweets) -> Void in
                self.tweets = tweets.reverse()
                self.tableView.reloadData()
            },
            failure: {(error) -> Void in
                // エラー処理
                let alertController = UIAlertController(
                    title: "エラー",
                    message: "エラーメッセージ",
                    preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(
                    title: "OK",
                    style: .Default,
                    handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
        })
    }
    
    func onRefresh(sender: UIRefreshControl) {
        refreshControl?.beginRefreshing()
        Tweet.getTweets(
            success: {(tweets) -> Void in
                self.tweets = tweets.reverse()
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            },
            failure: {(error) -> Void in
                // エラー処理
                let alertController = UIAlertController(
                    title: "エラー",
                    message: "エラーメッセージ",
                    preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(
                    title: "OK",
                    style: .Default,
                    handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                self.refreshControl?.endRefreshing()
        })
    }

    
    // 新規投稿ボタンが押された時にフォームを表示
    func didTouchNewTweetBarButton(sender: UIBarButtonItem) {
        let tweetCreateForm = TweetCreateFormController()
        let navigationController = UINavigationController(rootViewController: tweetCreateForm)
        presentViewController(navigationController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        let tweet = tweets[indexPath.row]
        cell.textLabel?.text = tweet.title

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            let tweet = self.tweets[indexPath.row]
            tweet.deleteTweet(
                success: {
                    print("success delete")
                    self.tweets.removeAtIndex(indexPath.row)
                    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                },
                failure: {(error) in
                    print(error)
                    print("fail delete")
                }
            )
        } 
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let tweet = tweets[indexPath.row]
                let controller = segue.destinationViewController as! TweetDetailViewController
                controller.tweet = tweet
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    

}
