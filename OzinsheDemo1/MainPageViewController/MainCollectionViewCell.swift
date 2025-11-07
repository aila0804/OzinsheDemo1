//
//  MainCollectionViewCell.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 07.11.2025.
//

import UIKit
import SnapKit

class MainCollectionViewCell: UICollectionViewCell {
    
    let identifier = "MainCollectionCell"
    
    let image = {
        let iv = UIImageView()
        iv.image = UIImage (named: "mainImage")
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        
        return iv
    }()
    
    let titleLabel = {
        let label = UILabel()
        label.text = "Суперколік Самурык"
        label.font = UIFont(name: "SF-Pro-Display-Semibold", size: 12)
        label.textColor = UIColor(named: "111827")
        label.numberOfLines = 2
        
        return label
    }()
    
}
