//
//  Login_6ViewController.swift
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

protocol Login_6DisplayLogic: class
{
  func displaySomething(viewModel: Login_6.Something.ViewModel)
}

class Login_6ViewController: UIViewController, Login_6DisplayLogic
{
  var interactor: Login_6BusinessLogic?
  var router: (NSObjectProtocol & Login_6RoutingLogic & Login_6DataPassing)?

    @IBOutlet weak var createAnAccount: UIButton!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var signUpSignInSegmentedCtrl: UISegmentedControl!
    @IBOutlet weak var credentialsTableView: UITableView!
    
    @IBOutlet weak var termsAlertLabel: UILabel!
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    var credentialsPlaceHolders = ["First Name", "Last Name", "Email", "Password", "Re-enter Password", "Create An Account"]
    
    
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
    let interactor = Login_6Interactor()
    let presenter = Login_6Presenter()
    let router = Login_6Router()
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
    if self.revealViewController() != nil {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    setupUI()
    doSomething()
  }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
  
    func setupUI(){
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear
        userImageView.layer.cornerRadius = userImageView.frame.width/2
        signUpSignInSegmentedCtrl.backgroundColor = UIColor.clear
        signUpSignInSegmentedCtrl.tintColor = UIColor.clear
        signUpSignInSegmentedCtrl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)], for: .selected)
        signUpSignInSegmentedCtrl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.lightGray, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)], for: .normal)
    }
    
    
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Login_6.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Login_6.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
    
    @IBAction func didTapOnSegmentedCtrl(_ sender: Any) {
        if signUpSignInSegmentedCtrl.selectedSegmentIndex == 0{
            credentialsPlaceHolders = ["First Name", "Last Name", "Email", "Password", "Re-enter Password", "Create An Account"]
            termsAlertLabel.isHidden = false
        }
        else{
            credentialsPlaceHolders = ["User Name", "Password", "Sign In"]
            termsAlertLabel.isHidden = true
        }
        self.credentialsTableView.reloadData()
    }
    
    
}

extension Login_6ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return credentialsPlaceHolders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if signUpSignInSegmentedCtrl.selectedSegmentIndex == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "login_6Detail") as! LogInDetail_6TableViewCell
           cell.backgroundColor = UIColor.appBackground
        
        if indexPath.row >= 0 && indexPath.row <= 4{
            cell.credentialTxtField.placeholder = "   " + credentialsPlaceHolders[indexPath.row]
            return cell
        }
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "login_6Button") as! LoginButton_6TableViewCell
        cell2.backgroundColor = .appBackground
        cell2.signUpsignInButton.setTitle(credentialsPlaceHolders[indexPath.row], for: .normal)
        return cell2
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "login_6Detail") as! LogInDetail_6TableViewCell
        cell.backgroundColor = UIColor.appBackground
        
        if indexPath.row == 0 || indexPath.row == 1{
            cell.credentialTxtField.placeholder = "   " + credentialsPlaceHolders[indexPath.row]
            return cell
        }
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "login_6Button") as! LoginButton_6TableViewCell
        cell2.backgroundColor = .appBackground
        cell2.signUpsignInButton.setTitle(credentialsPlaceHolders[indexPath.row], for: .normal)
        return cell2
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
}
