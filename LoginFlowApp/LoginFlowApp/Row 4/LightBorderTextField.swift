//
//  LightBorderTextField.swift
//  LoginFlowApp
//
//  Created by Thanos on 02/01/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

@IBDesignable
class LightBorderTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var attTxt: String?{
        didSet{
            attributedPlaceholder = NSAttributedString(string: attTxt!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray, .font: UIFont.boldSystemFont(ofSize: 14)])
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0{
        didSet{
            layer.borderColor = UIColor.lightGray.cgColor
            layer.borderWidth = borderWidth
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        borderWidth = 3
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        borderWidth = 3
    }
    

}
