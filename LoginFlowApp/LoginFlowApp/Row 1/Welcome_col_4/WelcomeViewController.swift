//
//  WelcomeViewController.swift
//  LoginFlowApp
//
//  Created by Thanos on 21/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SWRevealViewController

class WelcomeViewController: ButtonBarPagerTabStripViewController {

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
        super.viewDidLoad()
        
        navBarView.backgroundColor = UIColor.appRed
        
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
        
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUp_4VC") as! SignUp_4ViewController
        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignIn_4VC") as! SignIn_4ViewController
        
        return [vc1,vc2]
    }
}
