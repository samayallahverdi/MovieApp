//
//  HomeCell.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 07..
//

import UIKit
import Foundation

protocol SeeAllButtonDelegate {
    func seeAllButtonAction(category: String)
}

protocol HomeCellDelegate {
    func didSelectMovie(at index: Int)
}
class HomeCell: UICollectionViewCell {

    @IBOutlet weak var homeCellCollection: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var movies = [MovieResult]()
    var cellDelegate: HomeCellDelegate?
    var buttonDelegate: SeeAllButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homeCellCollection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
    
    func configure(title: String, movies: [MovieResult]) {
        titleLabel.text = title
        self.movies = movies
        homeCellCollection.reloadData()
    }
    @IBAction func seeAllButtonTapped(_ sender: Any) {
        buttonDelegate?.seeAllButtonAction(category: titleLabel.text ?? "")
        print(titleLabel.text ?? "")
    }
}

extension HomeCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
        cell.configure(data: movies[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellDelegate?.didSelectMovie(at: movies[indexPath.item].id ?? 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 167, height: collectionView.frame.height)
    }
    }

