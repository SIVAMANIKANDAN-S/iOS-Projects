//
//  WellcomePresenter.swift
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

protocol WellcomePresentationLogic
{
  func presentSomething(response: Wellcome.Something.Response)
}

class WellcomePresenter: WellcomePresentationLogic
{
  weak var viewController: WellcomeDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Wellcome.Something.Response)
  {
    let viewModel = Wellcome.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}