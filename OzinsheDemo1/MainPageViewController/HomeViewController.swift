//
//  HomeViewController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 22.08.2025.
//

import UIKit
import SnapKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController, MovieProtocol {
    
    var mainMovies: [MainMovies] = []
    
    //    lazy var labelName = {
    //        let label = "Name"
    //
    //        return label
    //    }()
    
    // Add TableView
    let tableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = UIColor(named: "111827")
        
        //Регистрация table view cell
        tableView.register(MainBannerTableViewCell.self, forCellReuseIdentifier: "MainBannerCell")
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "HistoryCell")
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainCell")
        tableView.register(GenreTableViewCell.self, forCellReuseIdentifier: "GenreCell")
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.backgroundColor = .white
        
        setupUI()
        downloadMainBanners()
        addNavBarImage()
    }
    
    func addNavBarImage () {
        let image = UIImage (named: "logoMainPage")
        let logoImageView = UIImageView(image: image)
        let imageItem = UIBarButtonItem.init (customView: logoImageView)
        navigationItem.leftBarButtonItem = imageItem
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(named: "111827" )
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
    
    // downloads
    // step 1
    func downloadMainBanners() {
    SVProgressHUD.show()
    let headers: HTTPHeaders = [
    "Authorization": "Behrer \(Storage.sharedInstance.accessToken)"
    ]
    AF.request(Urls.MAIN_BANNERS_URL, method: .get, headers: headers).responseData { response in
        
    SVProgressHUD.dismiss ()
    var resultString = ""
        if let data = response.data {
            resultString = String(data: data, encoding: .utf8)!
            print (resultString)
        }
        
        if response.response.statusCode == 200 {
            let json = JSON(response.data!)
            print ("JSON: \(json)")
            
            if let array = json.array {
                let movie = MainMovies()
                movie.cellType = .mainBanner
                for item in array {
                    let bannerMovie = BannerMovie(json: item)
                    movie.bannerMovie.append(bannerMovie)
                }
            }
            self mainMovies.append(movie)
            self.tableView.reloadData()
        } else {
    
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
