//
//  SignUp_8Router.swift
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

@objc protocol SignUp_8RoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SignUp_8DataPassing
{
  var dataStore: SignUp_8DataStore? { get }
}

class SignUp_8Router: NSObject, SignUp_8RoutingLogic, SignUp_8DataPassing
{
  weak var viewController: SignUp_8ViewController?
  var dataStore: SignUp_8DataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: SignUp_8ViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: SignUp_8DataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
