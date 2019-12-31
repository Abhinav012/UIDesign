//
//  SignIn_11Interactor.swift
//  LoginFlowApp
//
//  Created by Thanos on 28/12/19.
//  Copyright (c) 2019 Thanos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SignIn_11BusinessLogic
{
  func doSomething(request: SignIn_11.Something.Request)
}

protocol SignIn_11DataStore
{
  //var name: String { get set }
}

class SignIn_11Interactor: SignIn_11BusinessLogic, SignIn_11DataStore
{
  var presenter: SignIn_11PresentationLogic?
  var worker: SignIn_11Worker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: SignIn_11.Something.Request)
  {
    worker = SignIn_11Worker()
    worker?.doSomeWork()
    
    let response = SignIn_11.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
