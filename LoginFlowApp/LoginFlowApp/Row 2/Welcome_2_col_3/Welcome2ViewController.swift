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
    
    @IBOutlet weak var navBarView: UIView!
    override func viewDidLoad() {
        settings.style.buttonBarItemTitleColor = UIColor.white
        settings.style.buttonBarItemBackgroundColor = UIColor.clear
        settings.style.selectedBarBackgroundColor = UIColor.appBackground
        settings.style.buttonBarBackgroundColor = UIColor.appRed
        settings.style.buttonBarItemBackgroundColor = UIColor.appRed
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 13)
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        UIApplication.shared.statusBarView?.backgroundColor = .appStatusBarRed
        //self.title = "Welcome"
        navBarView.backgroundColor = .appRed
        
        
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
