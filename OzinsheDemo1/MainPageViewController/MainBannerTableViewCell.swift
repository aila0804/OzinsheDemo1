//
//  MainBannerTableViewCell.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 26.10.2025.
//

import UIKit
import SnapKit

class MainBannerTableViewCell: UITableViewCell {
    
    var delegate : MovieProtocol?
    var mainMovie = MainMovies()
    
    let identifier = "MainBannerCell"
    let bannerCollection: UICollectionView = {
        
        let layout = TopAlignedCollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 22.0, left: 24.0, bottom: 10.0, right: 24.0)
        layout.itemSize = CGSize(width: 300, height: 220)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: "BannerCell")
        collectionView.showsHorizontalScrollIndicator = false
    }()
}
