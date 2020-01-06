//
//  OptionsTableViewCell.swift
//  LoginFlowApp
//
//  Created by Thanos on 03/01/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {
   
    var doRememberMe:Bool = false
    
    @IBOutlet weak var rememberMeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func rememberMeTapped(_ sender: Any) {
       var imgName = ""
        doRememberMe.toggle()
        
        if doRememberMe{
            imgName = "checked_box"
        }else{
            imgName = "unchecked_box"
        }
        
        rememberMeButton.setImage(UIImage(named: imgName), for: .normal)
        
    }
}
