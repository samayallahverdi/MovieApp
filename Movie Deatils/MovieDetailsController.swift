//
//  MovieDetailsController.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 12..
//

import UIKit

class MovieDetailsController: UIViewController {
    
    @IBOutlet weak var movieDetailsCollection: UICollectionView!
    
    var selectedId: Int?
    let viewModel = MovieDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelConfig()
        configXib()
       
    }
    
    func viewModelConfig() {
        viewModel.getMovieInfoItems(movieId: selectedId)
        viewModel.error = { errorMessage in
            print(errorMessage)
        }
        viewModel.success = {
            self.movieDetailsCollection.reloadData()
//            print(self.viewModel.movieItems)
        }
        
    }
}


extension MovieDetailsController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.movieItems[indexPath.item]
        
        switch item.type {
            
        case .poster(let poster):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieTrailerCell", for: indexPath) as! MovieTrailerCell
            cell.trailerImage.loadImage(url: poster ?? "")
            return cell
        case .title(let title):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieNameCell", for: indexPath) as! MovieNameCell
                        cell.movieNameLabel.text = title
            return cell
        case .info(let info):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDetailsCell", for: indexPath) as! MovieDetailsCell
            cell.lengthLabel.text = "\(info.length  ?? "0")min"
            cell.ratingLabel.text = info.rating ?? ""
            cell.languageLabel.text = "English"
            cell.IMDBLabel.text = "⭐ \(info.rating ?? "0") / 10 IMDB"
            cell.genre = info.genres
            return cell
        case .description(let description):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDescriptionCell", for: indexPath) as! MovieDescriptionCell
                        cell.descriptionLabel.text = description
            return cell
        case .cast(let cast):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCastCell", for: indexPath) as! MovieCastCell
            cell.cast = cast
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = viewModel.movieItems[indexPath.item]
        switch item.type {
        case .poster:
            return CGSize(width: collectionView.frame.width - 20, height: 340)
        case .title:
            return CGSize(width: collectionView.frame.width - 20, height: 50)
        case .info:
            return CGSize(width: collectionView.frame.width - 20, height: 107)
        case .description:
            return CGSize(width: collectionView.frame.width - 20, height: 138)
        case .cast:
            return CGSize(width: collectionView.frame.width - 20, height: 204)
        }
    }
}

extension MovieDetailsController {
    func configXib() {
        movieDetailsCollection.register(UINib(nibName: "MovieTrailerCell", bundle: nil), forCellWithReuseIdentifier: "MovieTrailerCell")
        movieDetailsCollection.register(UINib(nibName: "MovieNameCell", bundle: nil), forCellWithReuseIdentifier: "MovieNameCell")
        movieDetailsCollection.register(UINib(nibName: "MovieDetailsCell", bundle: nil), forCellWithReuseIdentifier: "MovieDetailsCell")
        movieDetailsCollection.register(UINib(nibName: "MovieDescriptionCell", bundle: nil), forCellWithReuseIdentifier: "MovieDescriptionCell")
        movieDetailsCollection.register(UINib(nibName: "MovieCastCell", bundle: nil), forCellWithReuseIdentifier: "MovieCastCell")
    }
}
