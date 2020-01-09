//
//  Login22ViewController.swift
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

protocol Login22DisplayLogic: class
{
  func displaySomething(viewModel: Login22.Something.ViewModel)
}

class Login22ViewController: UIViewController, Login22DisplayLogic
{
  var interactor: Login22BusinessLogic?
  var router: (NSObjectProtocol & Login22RoutingLogic & Login22DataPassing)?
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var signInSignUpSegmentedControl: UISegmentedControl!
    @IBOutlet weak var navBarView: UIView!
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
    let interactor = Login22Interactor()
    let presenter = Login22Presenter()
    let router = Login22Router()
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
    if self.revealViewController() != nil {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    doSomething()
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.barStyle = .black
    }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Login22.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Login22.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
    
    func setupUI(){
        logoImageView.layer.cornerRadius = logoImageView.frame.width/2
        signInSignUpSegmentedControl.backgroundColor = UIColor.lightText
        signInSignUpSegmentedControl.tintColor = UIColor.appRed
        signInSignUpSegmentedControl.removeBorders()
        signInSignUpSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)], for: .selected)
        signInSignUpSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)], for: .normal)
        navBarView.backgroundColor = UIColor.appRed
        
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.appStatusBarRed
    }
}