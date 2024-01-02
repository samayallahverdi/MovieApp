//
//  CastCell.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 21..
//

import UIKit

class MovieCastCell: UICollectionViewCell {

    @IBOutlet weak var castCollection: UICollectionView!
    
    var cast: [Cast]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        castCollection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }

}
extension MovieCastCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cast?.count ?? 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
//        cell.genreLabelText.text = genre?[indexPath.item].name
        cell.titleLabel.text = cast?[indexPath.item].name
        cell.topImage.loadImage(url: cast?[indexPath.item].profilePath ?? "")
    return cell
    }
}
