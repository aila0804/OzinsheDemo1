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
    
    let subtitleLabel = {
        let label = UILabel()
        
        label.text = "Шытырман окигалы мультсериал Елбасынын, Yлы"
        label.font = UIFont (name: "SF-Pro-Display-Regular", size: 12)
        label.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1)
        
        return label
    }()
    
    let image = {
        let imageView = UIImageView()
        
        imageView.image = UIImage (named: "bannerImage")
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
}
