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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
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
