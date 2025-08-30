//
//  ProfileViewController.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 22.08.2025.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    lazy var profileImageView = {
        let profImageView = UIImageView()
        
        profImageView.image = UIImage(named: "avatar")
        
        return profImageView
    }()
    
    lazy var profileLabel = {
        let label = UILabel()
        
        label.text = "un_known@mail.com"
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 14)
        label.textColor = UIColor(named: "#111827")
    }
    
    //un_known@mail.com
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
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
