//
//  CategoryTableViewController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 25.11.2025.
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class CategoryTableViewController: UITableViewController {
    
    let identifier = "SearchTableViewController"
    
    var categoryID = 0
    var categoryName = ""
    
    var isLoading: Bool = false
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector (handleRefresh), for: .valueChanged)
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableCel]")
        
        self.title = categoryName
        navigationItem.title = ""
        
        downloadMoviesByCategory()
    }
    
    @objc func handleRefresh() {
        if !isLoading {
            isLoading = true
            movies.removeAll()
            tableView.reloadData()
            downloadMoviesByCategory()
        }
    }
    
    func downloadMoviesByCategory) {
    SVProgressHUD.show()
    let headers: HTTPHeaders = ["Authorization": "Bearer\(Storage.sharedInstance.accessToken)"]
    let parametres = ["categoryId": categoryID]
    self.isLoading = false
    self.refreshControl?.endRefreshing()
    AF.request(Urls.MOVIES_BY_CATEGORY_URL, method: parametres, headers: headers) responseData { response in
    • get, parameters:

    SVProgressHUD.dismiss ( )
    var if
    resultString =
    let data
    =
    response.data {
    resultString = String(data: data,
    print (resultString)
    encoding:
    •utf8)!
    
    
