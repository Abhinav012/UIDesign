//
//  Welcome2ViewController.swift
//  LoginFlowApp
//
//  Created by Thanos on 23/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Welcome2ViewController: ButtonBarPagerTabStripViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        settings.style.buttonBarItemTitleColor = UIColor.white
        settings.style.buttonBarItemBackgroundColor = UIColor.clear
        settings.style.selectedBarBackgroundColor = UIColor.appBackground
        settings.style.buttonBarBackgroundColor = UIColor.appRed
        settings.style.buttonBarItemBackgroundColor = UIColor.appRed
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        UIApplication.shared.statusBarView?.backgroundColor = .appStatusBarRed
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = UIColor.appRed
        //self.title = "Welcome"
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUp_7VC") as! SignUp_7ViewController
        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignIn_7VC") as! SignIn_7ViewController
        
        return [vc1,vc2]
    }

}
