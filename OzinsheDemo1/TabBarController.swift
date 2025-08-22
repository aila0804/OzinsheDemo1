//
//  TabBarController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 22.08.2025.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setupTabs() {
        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let favouriteVC = FavouriteViewController()
        let profileVC = ProfileViewController()

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
