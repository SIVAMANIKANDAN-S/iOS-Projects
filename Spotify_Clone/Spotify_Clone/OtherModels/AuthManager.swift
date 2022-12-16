//
//  AuthManager.swift
//  Spotify_Clone
//
//  Created by zs-mac-3 on 01/11/22.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    private init() {
        
    }
    
    
    
    struct Client {
        
        static let clientID = "39e38a61ffb846f49d48b4119ae56320"
        static let clientSecret = "f8538c6463ea426d8e66cc27788edd9b"
    }
    
    public var signInUrl : URL? {
        let scope = "user-read-private"
        let redirect_uri = "https://www.iosacademy.io"
        let urlBase : String = "https://accounts.spotify.com/authorize"
        
        let urlString : String = "\(urlBase)?response_type=code&client_id=39e38a61ffb846f49d48b4119ae56320&scope=\(scope)&redirect_uri=\(redirect_uri)&show_dialog=TRUE"
        
        return URL(string: urlString)
    }
    
    var isSignedIn : Bool {
        return false
    }
    
    var accessToken : String?{
        return nil
        }
    
    var refereshToken : String? {
        return nil
    }
    
    var tokenExpirationData : Data? {
        return nil
    }
    
    var shoulrefereshToken : Bool {
        return false
    }
    
    public func exchangeCodeForTocken (code:String , compleation:@escaping((Bool)->(Void))){
        
    }
    
    public func refereshAccesToken(){
        
    }
    
    public func cachToken(){
        
    }
}
