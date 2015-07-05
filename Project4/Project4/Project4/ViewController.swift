//
//  ViewController.swift
//  Project4
//
//  Created by Arvind Subramanian on 7/5/15.
//  Copyright (c) 2015 iOS Boogie. All rights reserved.
//

import UIKit
import STTwitter

class ViewController : UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // In order to use this, go into Settings on your iPhone (or simulator) and set up a twitter account of any kind. If you don't have a twitter account, make one.
        var API = STTwitterAPI.twitterAPIOSWithFirstAccount()
        API.verifyCredentialsWithUserSuccessBlock({ (username, userID) -> Void in
            API.getHomeTimelineSinceID(nil, count: 20, successBlock: { (statuses) -> Void in
                
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
        
    }
}

extension ViewController : UITableViewDataSource {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellReuseID = "TwitterCellID"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellReuseID) as? UITableViewCell
        
        if cell != nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellReuseID)
        }
        
        return cell!
    }

}

