//
//  MainTableViewCell.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 14.10.2025.
//

import UIKit
import SnapKit
import SDWebImage

protocol MovieProtocol {
    func movieDidSelect (movie: Movie)
}

class TopAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) ->
    [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)?.map { $0.copy() } as? [UICollectionViewLayoutAttributes]
        
        attributes?
            .reduce([CGFloat: (CGFloat, [UICollectionViewLayoutAttributes])]()) {
                guard $1.representedElementCategory == .cell else { return $0 }
                return $0.merging([ceil($1.center.y):($1.frame.origin.y, [$1])]) {
                    ($0.0 < $1.0 ? $0.0: $1.0, $0.1 + $1.1)
                }
            }
            .values.forEach { minY, line in
                line.forEach {
                    $0.frame
                    $0.frame.offsetBy(
                        dx: 0,
                        dy: minY - $0.frame.origin.y
                    )
                }
            }
        return attributes
    }
}

class MainTableViewCell: UITableViewCell {
    
    var delegate : MovieProtocol?
    
    var mainMovie = MainMovies()
    
    let identifier = "MainCell"
    
    let mainCollection: UICollectionView = {
        let layout = TopAlignedCollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: -36, right: 24)
        layout.itemSize = CGSize(width: 112, height: 220)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "MainCollectionCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(named: "111827")
        
        return collectionView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Телехикая"
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 16)
        label.textColor = UIColor(named: "111827")
        
        return label
    }()
    
    let allLabel: UILabel = {
        let label = UILabel()
        label.text = "Барлыгы"
        label.font = UIFont(name: "SF-Pro-Display-Semibold", size: 14)
        label.textColor = UIColor(red: 0.702, green: 0.463, blue: 0.969, alpha: 1)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        mainCollection.dataSource = self
        mainCollection.delegate = self
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData (mainMovie: MainMovies) {
        titleLabel.text = mainMovie.categoryName
        
        self.mainMovie = mainMovie
        
        mainCollection.reloadData()
        
        //дописать
    }
    
}
