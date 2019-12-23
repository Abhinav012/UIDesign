//
//  SignUp_3Router.swift
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

@objc protocol SignUp_3RoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SignUp_3DataPassing
{
  var dataStore: SignUp_3DataStore? { get }
}

class SignUp_3Router: NSObject, SignUp_3RoutingLogic, SignUp_3DataPassing
{
  weak var viewController: SignUp_3ViewController?
  var dataStore: SignUp_3DataStore?
  
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
  
  //func navigateToSomewhere(source: SignUp_3ViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: SignUp_3DataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
