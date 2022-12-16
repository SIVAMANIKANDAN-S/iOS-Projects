//
//  TabBarViewController.swift
//  Spotify_Clone
//
//  Created by zs-mac-3 on 01/11/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
      
        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let libraryVC = LibraryViewController()
        
        let home = UINavigationController(rootViewController: homeVC)
        let search = UINavigationController(rootViewController: searchVC)
        let library = UINavigationController(rootViewController: libraryVC)
        
        
        homeVC.title = "Home"
        searchVC.title = "Search"
        libraryVC.title = "Library"

        homeVC.navigationItem.largeTitleDisplayMode = .automatic
        searchVC.navigationItem.largeTitleDisplayMode = .automatic
        libraryVC.navigationItem.largeTitleDisplayMode = .never



        home.navigationBar.prefersLargeTitles = true
        search.navigationBar.prefersLargeTitles = true
        library.navigationBar.prefersLargeTitles = true
        
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        search.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        library.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 3)
        
        
        
        setViewControllers([home,search,library], animated: false)
        
        
        


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
