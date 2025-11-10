//
//  GenreTableViewCell.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 10.11.2025.
//

import UIKit
import SnapKit
import SDWebImage

class GenreTableViewCell: UITableViewCell {
    
    let identifier = "GenreCell"
    
    var mainMovie = MainMovies ()
    
    let genreCollection: UICollectionView = {
        let layout = TopAlignedCollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: -36, right: 24)
        layout.itemSize = CGSize(width: 184, height: 112)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: "GenreCollectionCell")
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.backgroundColor = UIColor (named: "111827")
        
        return collectionView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Жанрды танданыз"
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 16)
        label.textColor = UIColor(named: "111827")
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        genreCollection.dataSource = self
        //дописать
    }
    
}
