//
//  TabBarViewController.swift
//  iOTT
//
//  Created by zs-mac-3 on 28/11/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        tabBar.backgroundColor = .systemGray
        tabBar.isTranslucent = true
        
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingMoviesViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Search"
        vc4.title = "Downloads"
        
        
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)

    }


}
