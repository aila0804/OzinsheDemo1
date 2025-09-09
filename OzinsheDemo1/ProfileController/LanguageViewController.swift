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
        
        
        
        
    }
    
    
    
}

