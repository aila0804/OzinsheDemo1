//
//  ChangePasswordViewController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 16.09.2025.
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class ChangePasswordViewController: UIViewController {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let passwordLabel = {
        let label = UILabel()
        
        label.text = "Құпиясөз"
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 14)
        label.textColor = UIColor(named: "111827")
        
        return label
    }()
    
    let passwordTextField = {
        let textField = TextFieldWithPadding()
        
        textField.placeholder = "Сіздін купия сезініз"
        textField.isSecureTextEntry = true
        textField.textColor = UIColor (named: "111827")
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 12
        
        return textField
    }()
    
    
}
