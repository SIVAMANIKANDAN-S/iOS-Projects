//
//  AuthViewController.swift
//  Spotify_Clone
//
//  Created by zs-mac-3 on 14/11/22.
//

import UIKit
import WebKit

class AuthViewController: UIViewController {
    
    var  spotifyWebView : WKWebView  = {
        let preference = WKWebpagePreferences()
        preference.allowsContentJavaScript = true
        let configuarations = WKWebViewConfiguration()
        configuarations.defaultWebpagePreferences = preference
        configuarations.defaultWebpagePreferences = preference

        let webview = WKWebView(frame: .zero , configuration:configuarations )
        return webview
    }()
    
    //var spotifyWebView = WKWebView()
   
    
    public var compleationHandler : ((Bool) -> Void)?
    
    override func loadView() {
        super.loadView()
        self.view = spotifyWebView
        spotifyWebView.navigationDelegate = self
        self.edgesForExtendedLayout = []
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sign In"
//
//        if let spotifyAuthURL =  URL(string: "https://developer.spotify.com/documentation/general/guides/authorization/code-flow/"){
        if let spotifyAuthURL = AuthManager.shared.signInUrl{
            
            let spotifyAuthRequestRequest = URLRequest(url: spotifyAuthURL)
            
            
            spotifyWebView.load(spotifyAuthRequestRequest)
        }
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    


}

extension  AuthViewController : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = spotifyWebView.url else{
            return
        }
        
        guard (URLComponents(string: url.absoluteString)?.queryItems?.first(where: { $0.name == "code" })?.value) != nil else{
            return
        }
    }
}
