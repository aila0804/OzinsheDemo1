//
//  SearchViewController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 22.08.2025.
//

import UIKit
import SnapKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            guard layoutAttribute.representedElementCategory == .cell else {
                return
            }
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            layoutAttribute.frame.origin.x = leftMargin
            
            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY, maxY)
        }
        return attributes
    }
}

class SearchViewController: UIViewController {
    
    var isLoading: Bool = false
    
    var
    categories: [Category] = []
    
    var movies: [Movie] = []
    
    // add ui elements
    
    let searchTextField = {
        let searchTF = TextFieldWithPadding()
        searchTF.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        searchTF.placeholder = "Іздеу"
        searchTF.font = UIFont(name: "SF-Pro-Display-Semibold", size: 16)
        searchTF.textColor = UIColor (named: "111827")
        searchTF.layer.borderWidth = 1.0
        searchTF.layer.borderColor = UIColor (red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        searchTF.layer.cornerRadius = 12.0
        return searchTF
    }()
    
    lazy var exitButton = {
        let exitBut = UIButton ()
        exitBut.setImage (UIImage (named: "exitButton"), for: .normal)
        exitBut.contentMode = .scaleToFill
        exitBut.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
        return exitBut
    } ()
    
    lazy var searchButton = {
    let searchBut = UIButton()
    searchBut.setImage(UIImage (named: "searchVC"), for: .normal)
        searchBut.contentMode = .scaleToFill
    searchBut.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    return searchBut
    }()
    
    let titleLabel = {
        let label = UILabel()
        label.text = "Санаттар"
        label.font = UIFont (name: "SF-Pro-Display-Bold", size: 24)
        label.textColor = UIColor(named: "111827")
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16.0, left: 24.0, bottom: 16.0, right: 24.0)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: 128, height: 34)
        layout.estimatedItemSize.width = 100
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        collectionView.backgroundColor = UIColor (named: "111827" )
        collectionView.contentInsetAdjustmentBehavior = .automatic
        return collectionView
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = . none
        tv.allowsSelection = true
        tv.showsVerticalScrollIndicator = false
        tv.showsHorizontalScrollIndicator = false
        tv.backgroundColor = UIColor (named: "111827")
        //Регистрация table view cell
        tv.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableCell")
        return tv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}



//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
        // Do any additional setup after loading the view.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
