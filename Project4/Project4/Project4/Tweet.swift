//
//  Tweet.swift
//  Project4
//
//  Created by Arvind Subramanian on 7/5/15.
//  Copyright (c) 2015 iOS Boogie. All rights reserved.
//

import Foundation

struct Tweet {
    let author: String
    let message: String
}

struct TweetParser {
    static func parseTweet(tweetDict : NSDictionary) -> Tweet? {
        let message = tweetDict["text"] as? String
        var author: String?
        if let userDict = tweetDict["user"] as? NSDictionary {
            author = userDict["screen_name"] as? String
        }
 
        if message != nil && author != nil {
            return Tweet(author: author!, message: message!)
        }
        return nil
    }
    
    static func parseTweets(tweetDicts : [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        for tweetDict in tweetDicts {
            if let tweet = parseTweet(tweetDict) {
                tweets.append(tweet)
            }
        }
        
        return tweets
    }
    
}