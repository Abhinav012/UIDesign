//
//  SignUp_2Presenter.swift
//  LoginFlowApp
//
//  Created by Thanos on 20/12/19.
//  Copyright (c) 2019 Thanos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SignUp_2PresentationLogic
{
  func presentSomething(response: SignUp_2.Something.Response)
}

class SignUp_2Presenter: SignUp_2PresentationLogic
{
  weak var viewController: SignUp_2DisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: SignUp_2.Something.Response)
  {
    let viewModel = SignUp_2.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
