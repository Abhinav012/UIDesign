//
//  Extension.swift
//  LoginFlowApp
//
//  Created by Thanos on 19/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    class var appStatusBarRed: UIColor{
        return UIColor(red: 228/255, green: 74/255, blue: 27/255, alpha: 1)
    }
    
    class var appRed: UIColor{
        return UIColor(red: 252/255, green: 88/255, blue: 34/255, alpha: 1)
    }
    
    class var appBackground: UIColor{
        return UIColor(red: 240/255, green: 245/255, blue: 248/255, alpha: 1)
    }
    class var appFacebookBckgrd: UIColor{
        return UIColor(red: 63/255, green: 87/255, blue: 154/255, alpha: 1)
    }
}

extension UIApplication{
    var statusBarView: UIView?{
        if responds(to: Selector(("statusBar"))){
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
