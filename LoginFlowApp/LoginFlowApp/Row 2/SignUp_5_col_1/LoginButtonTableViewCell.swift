//
//  LoginButtonTableViewCell.swift
//  LoginFlowApp
//
//  Created by Thanos on 21/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit

class LoginButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var logButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        logButton.backgroundColor = .appRed
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
   
        // Configure the view for the selected state
    }

}
