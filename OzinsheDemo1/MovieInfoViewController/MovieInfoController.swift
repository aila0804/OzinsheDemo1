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
        scrollView.backgroundColor = UIColor(named: "FFFFFF - 111827")
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = never
        return scrollView
    }()
    
    
    
}
