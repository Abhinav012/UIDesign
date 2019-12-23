//
//  SignUp_3ViewController.swift
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

protocol SignUp_3DisplayLogic: class
{
  func displaySomething(viewModel: SignUp_3.Something.ViewModel)
}

class SignUp_3ViewController: UIViewController, SignUp_3DisplayLogic
{
  var interactor: SignUp_3BusinessLogic?
  var router: (NSObjectProtocol & SignUp_3RoutingLogic & SignUp_3DataPassing)?
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBOutlet weak var signInButton: UIButton!
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = SignUp_3Interactor()
    let presenter = SignUp_3Presenter()
    let router = SignUp_3Router()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    createAccountButton.backgroundColor = UIColor.appRed
    self.view.backgroundColor = UIColor.appRed
    signInButton.tintColor = UIColor.appStatusBarRed
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = SignUp_3.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: SignUp_3.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
