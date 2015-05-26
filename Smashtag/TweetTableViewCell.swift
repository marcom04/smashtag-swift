//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by Marco Marchini on 26/05/15.
//  Copyright (c) 2015 Mike Ocho. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell
{
    @IBOutlet weak var tweetProfileImageView: UIImageView!
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    var tweet: Tweet? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        // reset any existing tweet information
        tweetTextLabel?.attributedText = nil
        tweetScreenNameLabel?.text = nil
        tweetProfileImageView?.image = nil
        // tweetcreatedLabel?.text = nil
        
        // load new information from our tweet (if any)
        if let tweet = self.tweet {
            tweetTextLabel?.text = tweet.text
            if tweetTextLabel?.text != nil {
                for _ in tweet.media {
                    tweetTextLabel.text! += " 📷"
                }
            }
            
            tweetScreenNameLabel?.text = "\(tweet.user)"    // tweet.user.description
            
            if let profileImageURL = tweet.user.profileImageURL {
                if let imageData = NSData(contentsOfURL: profileImageURL) {     // blocks main thread
                    tweetProfileImageView?.image = UIImage(data: imageData)
                }
            }
            
//            let formatter = NSDateFormatter()
//            if NSDate().timeIntervalSinceDate(tweet.created) > 24*60*60 {
//                formatter.dateStyle = NSDateFormatterStyle.ShortStyle
//            } else {
//                formatter.timeStyle = NSDateFormatterStyle.ShortStyle
//            }
//            tweetCreatedLabel?.text = formatter.stringFromDate(tweet.created)
            
        }
    }
}
