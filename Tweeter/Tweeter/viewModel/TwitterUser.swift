//
//  TwitterUser.swift
//  TwitterClone
//
//  Created by zs-mac-3 on 24/11/22.
//

import Foundation
import Firebase


struct TwitterUser : Codable {
    
    let id : String
    var displayName : String = ""
    var userName:String = ""
    var bio : String = ""
    var followersCount : Int = 0
    var followingCount : Int = 0
    var createdOn : Date = Date()
    var profilePath : String = ""
    var isUserOnBoarded : Bool = false
    //var tweets : [Tweets] = []
    
    init(from user: User)  {
        self.id = user.uid
    }
    
}
