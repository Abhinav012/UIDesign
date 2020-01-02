//
//  SignIn_4ViewController.swift
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

protocol SignIn_4DisplayLogic: class
{
  func displaySomething(viewModel: SignIn_4.Something.ViewModel)
}

class SignIn_4ViewController: UIViewController, SignIn_4DisplayLogic
{
  var interactor: SignIn_4BusinessLogic?
  var router: (NSObjectProtocol & SignIn_4RoutingLogic & SignIn_4DataPassing)?

    var doRememberMe: Bool = false
    
    @IBOutlet weak var rememberMeButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
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
    let interactor = SignIn_4Interactor()
    let presenter = SignIn_4Presenter()
    let router = SignIn_4Router()
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
    setupUI()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = SignIn_4.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: SignIn_4.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
    
    func setupUI(){
        signInButton.backgroundColor = UIColor.appRed
        
        signUpButton.layer.shadowColor = UIColor.lightGray.cgColor
        signUpButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        signUpButton.layer.shadowOpacity = 1.0
    }
    
    // MARK: IBActions
    
    @IBAction func rememberMeTapped(_ sender: UIButton) {
        doRememberMe.toggle()
        var imgName = ""
        if doRememberMe{
            imgName = "checked_box"
        }
        else{
            imgName = "unchecked_box"
        }
        
        rememberMeButton.setImage(UIImage(named: imgName), for: .normal)
    }
    
}


extension SignIn_4ViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "SIGN IN")
    }
    
    
}
