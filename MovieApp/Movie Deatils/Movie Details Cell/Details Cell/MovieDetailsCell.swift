//
//  MovieDetailsCell.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 14..
//

import UIKit

class MovieDetailsCell: UICollectionViewCell {

    @IBOutlet weak var genreCollection: UICollectionView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!    
    @IBOutlet weak var IMDBLabel: UILabel!
    
    var genre: [Genre]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        genreCollection.register(UINib(nibName: "GenreCell", bundle: nil), forCellWithReuseIdentifier: "GenreCell")
    }

}

extension MovieDetailsCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genre?.count ?? 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as! GenreCell
        cell.genreLabelText.text = genre?[indexPath.item].name 
    return cell
    }
}
