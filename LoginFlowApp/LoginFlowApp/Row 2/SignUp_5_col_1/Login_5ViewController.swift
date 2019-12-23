//
//  Login_5ViewController.swift
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

protocol Login_5DisplayLogic: class
{
  func displaySomething(viewModel: Login_5.Something.ViewModel)
}

class Login_5ViewController: UIViewController, Login_5DisplayLogic
{
  var interactor: Login_5BusinessLogic?
  var router: (NSObjectProtocol & Login_5RoutingLogic & Login_5DataPassing)?

  var credentialsPlaceHolders = ["First Name", "Last Name", "Email", "Password", "Re-enter Password", "Create An Account", "Sign Up with Facebook"]
    
    @IBOutlet weak var signUpMenuBtn: UIButton!
    @IBOutlet weak var signInMenuBtn: UIButton!
    @IBOutlet weak var credentialsTableView: UITableView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    
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
    let interactor = Login_5Interactor()
    let presenter = Login_5Presenter()
    let router = Login_5Router()
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
    logoImageView.layer.cornerRadius = logoImageView.frame.width/2
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Login_5.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Login_5.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
    
    @IBAction func signUpBtnSelected(_ sender: Any) {
        signUpMenuBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        signUpMenuBtn.backgroundColor = UIColor.white
        
        signInMenuBtn.setTitleColor(UIColor.lightGray, for: .normal)
        signInMenuBtn.backgroundColor = UIColor.appBackground
        
        credentialsPlaceHolders =
        ["First Name", "Last Name", "Email", "Password", "Re-enter Password", "Create An Account", "Sign Up with Facebook"]
        credentialsTableView.reloadData()
        
    }
    
    @IBAction func signInBtnSelected(_ sender: Any) {
        signUpMenuBtn.setTitleColor(UIColor.lightGray, for: .normal)
        signUpMenuBtn.backgroundColor = UIColor.appBackground
        
        signInMenuBtn.setTitleColor(UIColor.black, for: .normal)
        signInMenuBtn.backgroundColor = UIColor.white
        
        credentialsPlaceHolders = []
        credentialsTableView.reloadData()
    }
    
    
}

extension Login_5ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return credentialsPlaceHolders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! LoginDetailTableViewCell
        
        if indexPath.row >= 0 && indexPath.row <= 4{
        cell.detailTextField.placeholder = "  " + credentialsPlaceHolders[indexPath.row]
        return cell
        }
         let cell2 = tableView.dequeueReusableCell(withIdentifier: "buttonCell") as! LoginButtonTableViewCell
          cell2.logButton.setTitle(credentialsPlaceHolders[indexPath.row], for: .normal)
        
        if indexPath.row == 6{
            cell2.logButton.backgroundColor = UIColor.appFacebookBckgrd
        }
        
        return cell2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
}


extension Login_5ViewController{
    
}
