//
//  Extension.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 08..
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(url: String) {
        let path = "\(NetworkHelper.imagePath)\(url)"
        if let finalUrl = URL(string: path) {
            self.kf.setImage(with: finalUrl)
        }
    }
}
