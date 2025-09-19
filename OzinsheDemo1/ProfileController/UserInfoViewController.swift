//
//  UserInfoViewController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 19.09.2025.
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class UserInfoViewController: UIViewController {
    
    var userID: Int?
    
    let yourNameLabel = {
        let label = UILabel()
        
        label.text = "Сіздің атыңыз"
        label.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 14)
        
        return label
    }()
    
    let nameTextField = {
        let textField = UITextField()
        
        textField.placeholder = "Атыңынызды енгізіңіз..."
        textField.textColor = UIColor(named: "111827")
        textField.font = UIFont(name: "SF-Pro-Display-Semibold", size: 16)
        
        return textField
    }()
        
}
