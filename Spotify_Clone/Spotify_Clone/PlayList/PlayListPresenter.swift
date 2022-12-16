//
//  PlayListPresenter.swift
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

protocol PlayListPresentationLogic
{
  func presentSomething(response: PlayList.Something.Response)
}

class PlayListPresenter: PlayListPresentationLogic
{
  weak var viewController: PlayListDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: PlayList.Something.Response)
  {
    let viewModel = PlayList.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
