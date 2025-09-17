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
        
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.isSecureTextEntry = true
        textField.textColor = UIColor(named: "111827")
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 12
        
        return textField
    }()
    
    let passwordImage = {
        let image = UIImageView()
        
        image.image = UIImage(named: "Password")
        return image
    }()
    
    lazy var showPasswordButton = {
        let button = UIButton()
        
        button.setImage (UIImage (named: "Show"), for: .normal)
        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let repeatPasswordLabel = {
        let label = UILabel()
        
        label.text = "Құпия сөзді кайталаңыз"
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 14)
        label.textColor = UIColor(named: "111827")
        return label
    }()
    
    let repeatPasswordTextField = {
        let textField = TextFieldWithPadding()
        
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.isSecureTextEntry = true
        textField.textColor = UIColor(named: "111827")
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    let repeatPasswordImage = {
        let image = UIImageView()
        
        image.image = UIImage(named: "Password")
        return image
    }()
    
    lazy var repeatShowPasswordButton = {
    let button = UIButton()
        
        button.setImage(UIImage(named: "Show"), for: .normal)
        button.addTarget (self, action: #selector(repeatShowPasswordTapped), for: .touchUpInside)
    return button
    }()
    
    let saveChangesButton = {
        let button = UIButton()
        
        button.setTitle("Өзгерістерді caқтay", for: .normal)
        button.backgroundColor = UIColor (red: 0.5, green: 0.18, blue: 0.99, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.layer.cornerRadius = 12
        return button
    }()
        
}
