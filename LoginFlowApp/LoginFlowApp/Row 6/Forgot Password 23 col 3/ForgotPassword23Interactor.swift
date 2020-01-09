//
//  ForgotPassword23Interactor.swift
//  LoginFlowApp
//
//  Created by Thanos on 07/01/20.
//  Copyright (c) 2020 Thanos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ForgotPassword23BusinessLogic
{
  func doSomething(request: ForgotPassword23.Something.Request)
}

protocol ForgotPassword23DataStore
{
  //var name: String { get set }
}

class ForgotPassword23Interactor: ForgotPassword23BusinessLogic, ForgotPassword23DataStore
{
  var presenter: ForgotPassword23PresentationLogic?
  var worker: ForgotPassword23Worker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: ForgotPassword23.Something.Request)
  {
    worker = ForgotPassword23Worker()
    worker?.doSomeWork()
    
    let response = ForgotPassword23.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
