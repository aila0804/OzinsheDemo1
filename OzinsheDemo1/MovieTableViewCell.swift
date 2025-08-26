//
//  MovieTableViewCell.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 25.08.2025.
//

import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {
    
    lazy var posterImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "Image")
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true  // обрезать картинку вместе с радиусом
        
        return imageView
    }()
    
    lazy var titleLabel = {
        
        let label = UILabel()
        
        label.text = "Қызғалдақтар мекені"
        
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 14)
        
        label.textColor = UIColor(named: "#111827")
        
        return label
    }()
    
    lazy var subtitleLabel = {
        
        let label = UILabel()
        
        label.text = "2020 • Телехикая • Мультфильм"
        
        label.font = UIFont(name: "SF-Pro-Display-Regular", size: 12)
        
        label.textColor = UIColor(named: "#9CA3AF")

        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
