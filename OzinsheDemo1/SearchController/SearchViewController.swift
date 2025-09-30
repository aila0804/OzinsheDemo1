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
