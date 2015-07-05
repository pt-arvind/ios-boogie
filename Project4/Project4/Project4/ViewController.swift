//
//  ViewController.swift
//  Project4
//
//  Created by Arvind Subramanian on 7/5/15.
//  Copyright (c) 2015 iOS Boogie. All rights reserved.
//

import UIKit
import STTwitter
import AVFoundation

class ViewController : UITableViewController {
    private var tweets = [Tweet]()
    private var speechSynthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // In order to use this, go into Settings on your iPhone (or simulator) and set up a twitter account of any kind. If you don't have a twitter account, make one.
        var API = STTwitterAPI.twitterAPIOSWithFirstAccount()
        API.verifyCredentialsWithUserSuccessBlock({[weak self] (username, userID) -> Void in
            API.getUserTimelineWithScreenName("arteezy", count: 20, successBlock: { (statuses) -> Void in
                var tweetDicts = statuses as! [NSDictionary]
                self?.tweets = TweetParser.parseTweets(tweetDicts)
                self?.tableView.reloadData()
            }, errorBlock: { (error) -> Void in
                println(error)
            })
        }, errorBlock: { (error) -> Void in
            println(error)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UITableViewDelegate {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let tweet = tweets[indexPath.row]
        let utterance = AVSpeechUtterance(string: tweet.message)
        speechSynthesizer.speakUtterance(utterance)
    }
}

extension ViewController : UITableViewDataSource {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellReuseID = "TwitterCellID"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellReuseID) as? UITableViewCell
        
        if cell != nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellReuseID)
        }
        let cellToDecorate = cell!
        let tweet = tweets[indexPath.row]
        
        cellToDecorate.textLabel?.text = tweet.message
        cellToDecorate.detailTextLabel?.text = tweet.author
        
        return cellToDecorate
    }

}

