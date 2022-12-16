//
//  HomePresenter.swift
//  TwitterClone
//
//  Created by zs-mac-3 on 05/12/22.
//

import Foundation


protocol HomePresentationLogic : AnyObject{
    func presentGotValuseToVC (data:[String : [String : String]])
    
}

   

class HomePresentor : HomePresentationLogic {
    weak var viewController : HomeDisplayLogic!
    
   
    func presentGotValuseToVC(data: [String : [String : String]]) {
        var tweets : [Tweets] = [Tweets]()

        
        for keys in data.keys {
        
            let tweet = Tweets(text: data[keys]?["text "],timeStamp: data[keys]?["timestamp "])
            tweets.append(tweet)
            }
        
        let sortedTweets = tweets.sorted(by: { (firstTweet: Tweets, secondTweet: Tweets) -> Bool in
            return firstTweet.timeStamp > secondTweet.timeStamp } )
            
        DispatchQueue.main.async {
            self.viewController.uopdateTimelineTableview(tweetsData: sortedTweets)
        }
        
    }
    
    
    
}
