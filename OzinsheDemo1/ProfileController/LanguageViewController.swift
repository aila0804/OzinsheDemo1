//
//  LanguageViewController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 09.09.2025.
//

import SnapKit
import UIKit
//import Localize_Swift

protocol LanguageProtocol {
    func languageDidChange()
}

class LanguageViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var viewTranslation = CGPoint(x: 0, y: 0)
    
    var delegate : LanguageProtocol?
    
    let languageArray = [["English", "en"], ["Қазақша", "kk"], ["Русский", "ru"]]
    
    let backView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(named: "#111827")
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        let homeView = UIView()
        
        homeView.backgroundColor = UIColor(red: 0.82, green: 0.835, blue: 0.859,
        alpha: 1)
        homeView.layer.cornerRadius = 3
        
        let languageLabel = UILabel()
        
        languageLabel.text = "Тіл"
        languageLabel.font = UIFont(name: "SF-Pro-Display-Bold", size: 24)
        languageLabel.textColor = UIColor(named: "#111827")
        
        view.addSubviews(homeView, languageLabel)
        
        homeView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(21)
            make.size.equalTo(CGSize(width: 64, height: 5))
            make.centerX.equalToSuperview()
        }
        
        languageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(58)
            make.left.equalToSuperview().inset(24)
        }
        
        return view
    }()
    
    let langTableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        // Регистрация TableViewCell
        tableView.register(LanguageTableViewCell.self, forCellReuseIdentifier: "LanguageCell")
        
        return tableView
    }()
    
}

