//
//  ProfileViewController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 22.08.2025.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController, LanguageProtocol {
    
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
    lazy var userInfoButton = {
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
            // addSubViews & Constraints
            
    func setupUI() {
        
        view.addSubviews(profileLabel, profileLabel, subtitleProfileLabel, backView)
        
        backView.addSubviews(languageLabel, languageButton, languageArrowImage, languageCellView, userInfoLabel, userInfoButton, userInfoArrowImage, userInfoCellView, passwordEditButton, passwordArrowImage, passwordCellView, darkModeLabel, darkModeSwitch)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "logOutButton"), style: .done, target: self, action: #selector(logOutTapButton))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 1, green: 0.25, blue: 0.17, alpha: 1)
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.centerX.equalToSuperview()
        }
        
        
        profileLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        subtitleProfileLabel.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        backView.snp.makeConstraints { make in
            make.top.equalTo(subtitleProfileLabel.snp.bottom).offset(24)
            make.top.bottom.left.right.equalTo(view.safeAreaLayoutGuide)
        }
        
        languageButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(languageCellView.snp.top).offset(1)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(64)
        }
        
        languageArrowImage.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(16)
            make.width.equalTo(16)
            make.left.equalTo(languageLabel.snp.right).offset(8)
            make.centerY.equalTo(languageButton)
        }
        
        languageLabel.snp.makeConstraints { make in
            make.centerY.equalTo(languageButton)
        }
        
        languageCellView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        
        userInfoButton.snp.makeConstraints { make in
            make.top.equalTo(languageCellView.snp.bottom).inset(1)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(64)
        }
        
        userInfoArrowImage.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(16)
            make.width.equalTo (16)
            make.left.equalTo(userInfoLabel.snp.right).offset(8)
            make.centerY.equalTo(userInfoButton)
        }
        
        userInfoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(userInfoButton)
        }
        
        userInfoCellView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.left.equalToSuperview().inset(24)
            make.height.equalTo(1)
            make.top.equalTo(userInfoButton.snp.bottom).inset(1)
        }
        
        passwordEditButton.snp.makeConstraints { make in
            make.top.equalTo(userInfoCellView.snp.bottom).offset(1)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(64)
        }
        
        passwordArrowImage.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(16)
            make.width.equalTo(16)
            make.centerY.equalTo(passwordEditButton)
        }
        
        passwordCellView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
            make.top.equalTo(passwordEditButton.snp.bottom).inset(1)
        }
        
        darkModeLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordCellView.snp.bottom).offset(25)
            make.left.equalToSuperview().inset(24)
            make.centerX.equalTo(darkModeSwitch)
        }

        darkModeSwitch.snp.makeConstraints { make in
            make.top.equalTo(passwordCellView.snp.bottom).offset(20)
            make.right.equalToSuperview().inset(24)
        }
    }
    
}
