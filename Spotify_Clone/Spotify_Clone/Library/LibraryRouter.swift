//
//  LibraryRouter.swift
//  Spotify_Clone
//
//  Created by zs-mac-3 on 01/11/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LibraryRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol LibraryDataPassing
{
  var dataStore: LibraryDataStore? { get }
}

class LibraryRouter: NSObject, LibraryRoutingLogic, LibraryDataPassing
{
  weak var viewController: LibraryViewController?
  var dataStore: LibraryDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: LibraryViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: LibraryDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
