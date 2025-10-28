//
//  BannerCollectionViewCell.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 28.10.2025.
//

import SnapKit
import UIKit
import SDWebImage

class BannerCollectionViewCell: UICollectionViewCell {
    
    // Add UI Elements
    let identifier = "BannerCell"
    
    let titleLabel = {
        let labelCell = UILabel()
        
        labelCell.text = "Кызгалдактар мекені"
        labelCell.font = UIFont(name: "SF-Pro-Display-Bold", size: 14)
        labelCell.textColor = UIColor(named: "FFFFFF")
        
        return labelCell
    }()
    
    
}
