//
//  SignUp_8Presenter.swift
//  LoginFlowApp
//
//  Created by Thanos on 23/12/19.
//  Copyright (c) 2019 Thanos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SignUp_8PresentationLogic
{
  func presentSomething(response: SignUp_8.Something.Response)
}

class SignUp_8Presenter: SignUp_8PresentationLogic
{
  weak var viewController: SignUp_8DisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: SignUp_8.Something.Response)
  {
    let viewModel = SignUp_8.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
