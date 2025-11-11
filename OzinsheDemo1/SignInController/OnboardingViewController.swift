//
//  OnboardingViewController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 11.11.2025.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    var arraySlides = [["firstSlide", "ÖZINSE-re кош келдін!", "Фильмдер, телехикаялар, ситкомдар, анимациялык жобалар, телебагдарламалар мен реалити-шоулар, аниме жене таты баскалары"], ["secondSlide", "ÖZINSE-re кош келдін!", "Кез келген курылгыдан кара. Суйікті фильмінді косымша телемсіз телефоннан, планшеттен, ноутбуктан кара"], ["thirdSlide", "ÖZIN$E-re кош келдін!", "Тіркелу онай. Казір тіркел де калаган фильміне кол жеткіз"]]
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    
    let collectionView: UICollectionViefv = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: "OnboardingCell")
        collectionView.backgroundColor = UIColor(named: "111827")
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    let pageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 3
        pc.tintColor = black
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = UIColor(red: 0.7, green: 0.46, blue: 0.97, alpha: 1)
        pc.contentVerticalAlignment = .center
        pc.contentHorizontalAlignment = .center
        
        return pc
    }()
    
    
    
}
