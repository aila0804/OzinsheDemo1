//
//  SignInViewController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 15.11.2025.
//

import UIKit
import SnapKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class SignInViewController: UIViewController {
    let welcomeLabel = {
        let label = UILabel()
        label.text = "Салем"
        label.font = UIFont (name: "SF-Pro-Display-Bold", size: 24)
        label.textColor = UIColor (named: "111827")
        
        return label
    }()
    
    let signInLabel = {
        let label = UILabel()
        label.text = "Аккаунтка кірініз"
        label.font = UIFont (name: "SF-Pro-Display-Regular", size: 16)
        label.textColor = UIColor(red: 0.42, green: 0.45, blue: 0.50, alpha: 1.00)
        
        return label
    }()
    
    let emailLabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont (name: "SF-Pro-Display-Bold", size: 14)
        label.textColor = UIColor(named: "111827")
        
        return label
    }()
    
    let emailTextField = {
        let tf = TextFieldWithPadding()
        tf.placeholder = "Сіздін email"
        tf.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        tf.textColor = UIColor (named: "111827 - FFFFFF")
        tf.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        tf.layer.cornerRadius = 12
        tf. layer.borderWidth = 1
        
        return tf
    }()
    
    let emailImage = {
        let iv = UIImageView()
        iv.image = UIImage(named: "email")
        
        return iv
    }()
    
    let passwordLabel = {
        let label = UILabel()
        label.text = "Купиясез"
        label.font = UIFont (name: "SF-Pro-Display-Bold", size: 14)
        label.textColor = UIColor(named: "111827")
        
        return label
    }()
    
    let passwordTextField = {
        let tf = TextFieldWithPadding()
        tf.placeholder = "Сіздін купия сезініз"
        tf.font = UIFont (name: "SF-Pro-Display-Regular", size: 16)
        tf.textColor = UIColor(named: "111827")
        tf.isSecureTextEntry = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        
        return tf
    }()
    
    let passwordImage = {
        let iv = UIImageView()
        iv.image = UIImage(named: "password")
        
        return iv
    }()
    
    lazy var showPasswordButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "showPassword"), for: .normal)
        button.addTarget(self, action: #selector(showPassTapped), for: .touchUpInside)
        
        return button
    }()
    
    let repeatPasswordLabel = {
        let label = UILabel()
        label.text = "Купиясоз"
        label. font = UIFont (name: "SF-Pro-Display-Bold", size: 14)
        label.textColor = UIColor(named: "111827")
        
        return label
    }()
    
    let repeatPasswordTextField = {
        let tf = TextFieldWithPadding()
        tf.placeholder = "Сіздін купия сезініз"
        tf.font = UIFont(name: "SF-Pro-Display-Regular", size: 16)
        tf.textColor = UIColor(named: "111827")
        tf.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        tf.isSecureTextEntry = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        
        return tf
    }()
    
    let repeatPasswordImage = {
        let iv = UIImageView()
        iv.image = UIImage(named: "password")
        
        return iv
    }()
    
    lazy var repeatShowPasswordButton = {
        let button = UIButton()
        button. setImage (UIImage (named: "showPassword"), for: .normal)
        button.addTarget(self, action: #selector (repeatShowPassTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var signUpButton = {
        let button = UIButton()
        button.setTitle("Тіркелу", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont (name: "SF-Pro-Display-Semibold", size: 16)
        button. backgroundColor = UIColor(red: 0.49, green: 0.18, blue: 0.99, alpha: 1.00)
        button.layer.cornerRadius = 12
        button.addTarget (self, action: #selector(signUpTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var signInButton = {
        let button = UIButton()
        button.setTitle("Kipy", for: .normal)
        button.titleLabel?. font = UIFont (name: "SF-Pro-Display-Semibold", size: 14)
        button.setTitleColor(UIColor(red: 0.49, green: 0.18, blue: 0.99, alpha: 1.00), for: .normal)
        button. addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        return button
    }()
    
    let questionLabel = {
        let label = UILabel()
        label.text = "Сізде аккаунт бар ма?"
        label.font = UIFont (name: "SF-Pro-Display-Semibold", size: 14)
        label.textColor = UIColor(red: 0.42, green: 0.45, blue: 0.50, alpha: 1.00)
        label.textAlignment = .right
        
        return label
    }()
    
    // View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        setupUI()
        hideKeyboardWhenTappedAround()
        localizedLanguage()
    }
    
    // Add functional
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer (target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func signUpTapped() {
        let signUpViewController = SignUpViewController()
        
        navigationController?.show(signUpViewController, sender: self)
        navigationItem.title = ""
    }
    
    @objc func signInTapped() {
    let email = emailTextField.text!
    let password = passwordTextField.text!
        
    SVProgressHUD.show()
        
    let parameters = ["email": email, "password": password]
        
        AF.request(Urls.SIGN_IN_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { response in
            
    SVProgressHUD.dismiss()
    var resultString = ""
    if let data = response.data {
    resultString = String(data: data, encoding: .utf8)!
    print(resultstrifg)
    }
    if
    response. response?. statusCode ==
    200 {
    let json = JSON (response.data!)
    print ("JSON: ((json)")
    if let token = json[ "accessToken"].string {
    Storage.sharedInstance.accessToken = token
    UserDefaults.standard.set (token, forkey: "accessToken")
    self.startApp ()
    ｝
    else {
    SVProgressHUD.showError(withStatus:
    "CONNECTION_ERROR" localized ())
    }
    ｝
    else
    var ErrorStrina = "CONNECTION ERROR". localized()
