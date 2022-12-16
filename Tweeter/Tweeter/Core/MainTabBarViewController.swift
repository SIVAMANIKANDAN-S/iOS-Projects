//
//  MainTabBarViewController.swift
//  Tweeter
//
//  Created by zs-mac-3 on 14/12/22.


import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let notificationController = UINavigationController(rootViewController: NotificationViewController())
        let directMessgeViewController = UINavigationController(rootViewController: DirectMessegesViewController())
        
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        homeViewController.tabBarItem.selectedImage  = UIImage(systemName: "house.fill")
        
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        notificationController.tabBarItem.image = UIImage(systemName: "bell")
        notificationController.tabBarItem.selectedImage = UIImage(systemName: "bell.fill")
        
        directMessgeViewController.tabBarItem.image = UIImage(systemName: "envelope")
        directMessgeViewController.tabBarItem.selectedImage = UIImage(systemName: "envelope.fill")
        
        setViewControllers([homeViewController,searchViewController,notificationController,directMessgeViewController], animated: true)
        
       selectedIndex = 0
        
    }


}

