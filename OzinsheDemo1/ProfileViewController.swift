//
//  ProfileViewController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 22.08.2025.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    lazy var profileImageView = {
        let profImageView = UIImageView()
        
        profImageView.image = UIImage(named: "avatar")
        
        return profImageView
    }()
    
    lazy var profileLabel = {
        let label = UILabel()
        
        label.text = "My Profile"
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 24)
        label.textColor = UIColor(named: "#111827")
        
        return label
    }()
    
    lazy var subtitleProfileLabel = {
        let label = UILabel()
        
        label.text = "un_known@mail.com"
        label.font = UIFont(name: "SF-Pro-Display-Regular", size: 14)
        label.textColor = UIColor(named: "#9CA3AF")
        
        return label
    }()
    
    // buttons
    
    let backView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "#F9FAFB")
        
        return view
    }()
    
    lazy var languageButton = {
        let button = UIButton()
        
        button.setTitle("Language", for: .normal)
        button.setTitleColor(UIColor(named: "#111827"), for: .normal)
        button.titleLabel?.font = UIFont(name: "SF-Pro-Display-Semibold", size: 16)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(languageButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    lazy var languageLabel = {
        let label = UILabel()
        
        label.text = "English"
        label.textColor = UIColor(named: "#111827")
        label.font = UIFont(name: "SF-Pro-Display-Semibold", size: 12)
        
        return label
    }()
    
    lazy var languageArrowImage = {
        let arrowImage = UIImageView()
        
        arrowImage.image = UIImage(named: "Chevron-Right-Outline")
        
        return arrowImage
    }()
    
    lazy var languageCellView = {
        let cell = UIView()
        
        cell.backgroundColor = UIColor(named: "#D1D5DB")
        
        return cell
    }()
    
    // BUTTON ELEMENTS
    lazy var UserInfoButton = {
        let button = UIButton()
        button.setTitle("Personal Information", for: .normal)
        button.setTitleColor(UIColor(named: "#111827"), for: .normal)
        button.titleLabel?.font = UIFont(name: "SF-Pro-Display-Semibold", size: 16)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(userInfoButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    let userInfoLabel = {
        let label = UILabel()
        
        label.text = "Edit"
        label.textColor = UIColor(named: "#9CA3AF")
        label.font = UIFont(name: "SF-Pro-Display-Semibold", size: 12)
        
        return label
    }()
    
    let userInfoArrowImage = {
        let arrowImage = UIImageView()
        
        arrowImage.image = UIImage(named: "Chevron-Right-Outline")
        
        return arrowImage
    }()
    
    let userInfoCellView = {
        let cell = UIView()
        
        cell.backgroundColor = UIColor(named: "#D1D5DB")
        
        return cell
    }()
    
    //change password buttons
    
    lazy var passwordEditButton = {
        let button = UIButton()
        
        button.setTitle("Change Password", for: .normal)
        button.setTitleColor(UIColor(named: "#111827"), for: .normal)
        button.titleLabel?.font = UIFont(name: "SF-Pro-Display-Semibold", size: 16)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(changePasswordTapped), for: .touchUpInside)
        
        return button
    }()
    
    let passwordArrowImage = {
        let arrowImage = UIImageView()
        
        arrowImage.image = UIImage(named: "Chevron-Right-Outline")
        
        return arrowImage
    }()
    
    let passwordCellView = {
        let cell = UIView()
        
        cell.backgroundColor = UIColor(named: "#D1D5DB")
        
        return cell
    }()
    
    // Dark mode elements
    
    let darkModeLabel = {
        let label = UILabel()
        
        label.text = "Dark Mode"
        label.textColor = UIColor(named: "#111827")
        label.font = UIFont(name: "SF-Pro-Display-Semibold", size: 16)
        
        return label
    }()
    
    lazy var darkModeSwitch = {
        let dMSwitch = UISwitch()
        
        dMSwitch.onTintColor = UIColor(named: <#T##String#>)
        dMSwitch.thumbTintColor = UIColor(named: <#T##String#>)
        dMSwitch.addTarget(self, action: #selector(changeSwitch), for: .touchUpInside)
        
        return dMSwitch
    }()
    
    // VC Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        setupUI()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "#FFFFFF")
        
        navigationItem.title = "Profile"
    }
    
    // add functions
    
    func localizeLanguage() {
        
    }
    
    func languageDidChange() {
        
    }
    
    @objc func languageButtonTapped() {
        let languageVC = LanguageViewController()
        
        languageVC.modalPresentationStyle = .overFullScreen
        
        languageVC.delegate = self
        
        present(languageVC, animated: true, completion: nil)
    }
    
    @objc func logOutTapButton() {
        let logOutVC = LogOutViewController()
        
        logOutVC.modalPresentationStyle = .overFullScreen
        
        self.present(logOutVC, animated: true, completion: nil)
    }
    
    @objc func userInfoButtonTapped() {
        let userInfoVC = UserInfoViewController()
        
        userInfoVC.modalPresentationStyle = .fullScreen
        
        navigationController?.show(userInfoVC, sender: self)
        navigationItem.title = ""
    }
    
    @objc func changePasswordTapped() {
        let changePassword = ChangePasswordViewController()
        
        navigationController?.show(changePassword, sender: self)
        navigationItem.title = ""
    }
    
    @objc func changeSwitch(_ dmswitch: UISwitch) {
        if dmswitch.isOn {
            if let windowScene = UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene}).first(where: { $0.activationState == .foregroundActive }) {
                windowScene.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .dark
                }
            }
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene }).first(where: { $0.activationState == .foregroundActive }) {
                windowScene.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .light
                }
            }
        }
    }
            
            
    func setupUI() {
        
        view.addSubview(profileImageView)
        view.addSubview(profileLabel)
        
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(132)
            make.left.equalToSuperview().inset(128)
            make.height.equalTo(120)
            make.width.equalTo(120)
        }
        
        
        profileLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(8)
            make.left.equalTo(profileImageView.snp.right).offset(17)
            make.right.equalToSuperview().inset(24)
        }
        
        subtitleProfileLabel.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom).offset(8)
            make.left.equalTo(profileImageView.snp.right).offset(17)
            make.right.equalToSuperview().inset(24)
        }
    }
    
    
    
    
    
}
