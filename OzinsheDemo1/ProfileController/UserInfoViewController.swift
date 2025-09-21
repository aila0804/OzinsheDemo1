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
    
    let grayView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
        
        return view
    }()
    
    let emailLabel = {
        let label = UILabel ()
        label.text = "Email"
        label.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        label.font = UIFont (name: "SF-Pro-Display-Bold", size: 14)
        
        return label
    }()
    
    let emailTextField = {
        let textField = UITextField()
        textField.placeholder = "ali@gmail.com"
        textField.textColor = UIColor(named: "111827")
        textField.font = UIFont (name: "SF-Pro-Display-Semibold", size: 16)
        
        return textField
    }()
    
    let grayView2 = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
        
        return view
    }()
    
    let phoneLabel = {
        let label = UILabel()
        label.text = "Телефон"
        label.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 14)
        
        return label
    }()
    
    let phoneTextField = {
        let textField = UITextField()
        textField.placeholder = "+7 702 732-10-31"
        textField.textColor = UIColor(named: "111827")
        textField.font = UIFont (name: "SF-Pro-Display-Semibold", size: 16)
        return textField
    }()
    
    let grayView3 = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
        
        return view
    }()
    
    let birthLabel = {
        let label = UILabel()
        
        label.text = "Туылған күні"
        label.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 14)
        
        return label
    }()
    
    let birthTextField = {
        let textField = UITextField()
        
        textField.placeholder = "2005-01-28"
        textField.textColor = UIColor(named: "111827")
        textField.font = UIFont (name: "SF-Pro-Display-Semibold", size: 16)
        
        return textField
    }()
    
    let grayView4 = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
        
        return view
    }()
    
    lazy var saveChangesButton = {
        let button = UIButton()
        
        button.setTitle("Өзгерістерді caқтay", for: .normal)
        button.backgroundColor = UIColor(red: 0.5, green: 0.18, blue: 0.99, alpha: 1)
        button.titleLabel?.font = UIFont (name: "SF-Pro-Display-Semibold", size: 16)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(saveInfoButton), for: .touchUpInside)
        
        return button
    }()
    
    // cycle
    
    override func viewDidLoad() {
    super.viewDidLoad()
//    setupUI()
//    downloadPersonalInfo()
//    localizeLanguage()
        
    }
    
}
