//
//  SignUpViewController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 15.11.2025.
//

import UIKit
import SnapKit
import SVProgressHUD
import Localize_Swift
import SwiftyJSON
import Alamofire

class SignUpViewController: UIViewController {
    
    let welcomeLabel = {
        let label = UILabel()
        label.text = "Тіркелу"
        label.font = UIFont (name: "SF-Pro-Display-Bold", size: 24)
        label.textColor = UIColor(named: "111827")
        
        return label
    }()
    
    let signUpLabel = {
        let label = UILabel()
        label.text = "Деректерді толтырыныз"
        label.font = UIFont (name: "SF-Pro-Display-Regular", size: 16)
        label.textColor = UIColor(red: 0.42, green: 0.45, blue: 0.50, alpha: 1.00)
        
        return label
    }()
    
    let emailLabel = {
        let label = UILabel()
        label.text = "Email"
        label. font = UIFont (name: "SF-Pro-Display-Bold", size: 14)
        label.textColor = UIColor(named: "111827")
        
        return label
    }()
    
    let emailTextField = {
        let tf = TextFieldWithPadding()
        tf. placeholder = "Сіздін email"
        tf. font = UIFont (name: "SF-Pro-Display-Regular", size: 16)
        tf.textColor = UIColor (named: "111827")
        tf. layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00). cgColor
        tf. layer.cornerRadius = 12
        tf. layer.borderWidth = 1
        
        return tf
    }()
    
    let emailImage = {
        let iv = UIImageView()
        iv.image = UIImage (named: "email")
        
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
        
        setupUI()
        hideKeyboardWhenTappedAround()
        localizedLanguage()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
    }
    
    // Add functional
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func showPassTapped () {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @objc func repeatShowPassTapped() {
        repeatPasswordTextField.isSecureTextEntry = !repeatPasswordTextField.isSecureTextEntry
    }
    
    @objc func signInTapped() {
        let signInViewController = SignInViewController()
        navigationController?.show(SignInViewController, sender: self)
        navigationItem.title = ""
    }
    
    @objc func signUpTapped() {
        let signUpEmail = emailTextField.text!
        let signUpPassword = passwordTextField.text!
        let confirmPassword = repeatPasswordTextField.text!
        
        if signUpPassword == confirmPassword {
            
            SVProgressHUD.show()
            let parameters = ["email": signUpEmail, "password": signUpPassword]
            AF.request(Urls.SIGN_UP_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { response in
                
                SVProgressHUD.dismiss()
                var resultString = ""
                if let data = response.data {
                    resultString = String(data: data, encoding: .utf8)!
                    print(resultString)
                }
                if response.response?.statusCode == 200 {
                    let json = JSON(response.data!)
                    print("JSON: \(json)")
                    
                    if let token = json["accessToken"].string {
                        Storage.sharedInstance.accessToken = token
                        UserDefaults.standard.set(token, forkey: "accessToken")
                        self.startApp()
                    } else {
                        SVProgressHUD.showError(withStatus: "CONNECTION_ERROR".localized())
                    }
                } else {
                    var ErrorString = "CONNECTION_ERROR".localized()
                    if let sCode = response.response?.statusCode {
                        ErrorString = ErrorString + "\(sCode)"
                    }
                    ErrorString = ErrorString + "\(resultString)"
                    SVProgressHUD.showError(withStatus: "\(ErrorString)")
                }
            }
            print( "Registration is successful")
        } else {
            showAlert (message: "Try again")
        }
    }
    
    func showAlert (message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func startApp() {
        let tabViewController = TabBarController ()
        tabViewController.modalPresentationStyle = .fullScreen
        self.present (tabViewController, animated: true, completion: nil)
    }
    
}
