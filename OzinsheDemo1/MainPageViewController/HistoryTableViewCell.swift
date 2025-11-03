//
//  HistoryTableViewCell.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 03.11.2025.
//

import UIKit
import SnapKit
import SDWebImage

class HistoryTableViewCell: UITableViewCell {
    
    var mainMovie = MainMovies()
    
    var delegate : MovieProtocol?
    
    let identifier = "HistoryCell"
    
    let historyCollection: UICollectionView = {
        let layout = TopAlignedCollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: -36, right: 24)
        layout.itemSize = CGSize(width: 184, height: 156)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HistoryCollectionViewCell.self, forCellWithReuseIdentifier: "HistoryCollectionCell")
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.backgroundColor = UIColor(named: "111827")
        
        return collectionView
    }()
    
    
}
