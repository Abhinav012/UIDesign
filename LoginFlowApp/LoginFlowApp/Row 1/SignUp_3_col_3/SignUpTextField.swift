//
//  UserCredentialTextField.swift
//  LoginFlowApp
//
//  Created by Thanos on 20/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit

@IBDesignable class SignUpTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var attText: String?{
        didSet{
            self.attributedPlaceholder = NSAttributedString(string: attText!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    self.layer.borderColor = UIColor.white.cgColor
    self.layer.borderWidth = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        
    }
    
}
