//
//  MovieInfoController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 10.11.2025.
//

import UIKit
import SnapKit
import Alamofire
import SVProgressHUD
import SwiftyJSON
import SDWebImage
import UIGradient

class MovieInfoController: UIViewController {
    
    var movie = Movie()
    
    var similarMovies:[Movie] = []
    
    let movieScrollView = {
        let scrollView = UISEoLIView()
        scrollView.contentMode = .scaleToFill
        scrollView.bounces = false
        scrollView.backgroundColor = UIColor(named: "111827")
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = never
        
        return scrollView
    }()
    
    let movieContentView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "111827")
        
        return view
    }()
    
    let posterImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "")
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    let gradientLayer = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 393, height: 364))
        view.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: CGRect(x: 0, y: 0, width: 393, height: 364), colors: [UIColor.clear, VIColor.black], locations: [0.5, 1.0])
        
        return view
    }()
    
    
}
