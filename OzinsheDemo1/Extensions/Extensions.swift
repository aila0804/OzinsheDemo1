//
//  Untitled.swift
//  OzinsheDemo1
//
//  Created by Aila Aila on 08.09.2025.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
