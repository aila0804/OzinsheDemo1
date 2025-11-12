//
//  OnboardingCell.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 11.11.2025.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    let identifier = "OnboardingCell"
    
    let imageO: UIImageView = {
        let image = UIImageView()
        image.image = UIImage (named: "firstSlide")
        
        return image
    }()
    
    let welcomeLabel = {
        let label = UILabel()
        label.text = "ÖZIN$E-re кош келдін!"
        label.font = UIFont (name: "SF-Pro-Display-Bold", size: 24)
        label.textColor = UIColor(named: "111827")
        label.textAlignment = .center
        
        return label
    }()
    
    let fullInfoLabel = {
        let label = UILabel()
        label.text = "Фильмдер, телехикаялар, ситкомдар, анимациялык жобалар, телебагдарламалар мен реалити-шоулар, аниме жене тагы баскалары"
        label.font = UIFont (name: "SF-Pro-Display-Semibold", size: 14)
        label.textColor = UIColor(red: 0.42, green: 0.447, blue: 0.502, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 6
        
        return label
    }()
    
    let nextButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.5, green: 0.18, blue: 0.99, alpha: 1)
        button.setTitle("Эрі карай", for: .normal)
        button.setTitleColor(white, for: .normal)
        button.titleLabel?.font = UIFont (name: "SF-Pro-Display-Semibold", size: 16)
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    let skipButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "111827")
        button.setTitle("Откізу", for: .normal)
        button.setTitleColor(UIColor (named: "111827"), for: .normal)
        button.titleLabel?.font = UIFont(name: "SF-Pro-Display-Semibold", size: 12)
        button.layer.cornerRadius = 8
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init (frame: frame)
        
        setupUI()
        backgroundColor = UIColor(named: "111827")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        addSubviews(imageO, welcomeLabel, fullInfoLabel, nextButton, skipButton)
        
        imageO.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(504)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(image.snp.bottom).inset(2)
        }
        
        fullInfoLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(32)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(24)
        }
        
        nextButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(50)
            make.height.equalTo(56)
        }
        
        skipButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.top.equalToSuperview().offset(60)
            make.size.equalTo(CGSize(width: 69, height: 24))
        }
        
    }
    
}
