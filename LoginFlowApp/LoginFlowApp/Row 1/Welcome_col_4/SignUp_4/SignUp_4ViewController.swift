//
//  SignUp_4ViewController.swift
//  LoginFlowApp
//
//  Created by Thanos on 21/12/19.
//  Copyright (c) 2019 Thanos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import XLPagerTabStrip

protocol SignUp_4DisplayLogic: class
{
  func displaySomething(viewModel: SignUp_4.Something.ViewModel)
}

class SignUp_4ViewController: UIViewController, SignUp_4DisplayLogic
{
  var interactor: SignUp_4BusinessLogic?
  var router: (NSObjectProtocol & SignUp_4RoutingLogic & SignUp_4DataPassing)?

    @IBOutlet weak var createAnAccountButton: UIButton!
    
    
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
    let interactor = SignUp_4Interactor()
    let presenter = SignUp_4Presenter()
    let router = SignUp_4Router()
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
    self.view.backgroundColor = UIColor.appBackground
    createAnAccountButton.backgroundColor = UIColor.appRed
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = SignUp_4.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: SignUp_4.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}

extension SignUp_4ViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "SIGN UP")
    }
    
    
}
