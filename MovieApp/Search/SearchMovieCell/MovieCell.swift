//
//  MovieCell.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 11..
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configureCell(image: String, name: String, rating: Double, description: String) {
        movieImage.image = UIImage(named: image)
        movieName.text = name
        movieRating.text = "rating"
        movieDescription.text = description
    }
}
