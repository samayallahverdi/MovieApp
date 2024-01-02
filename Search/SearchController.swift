//
//  SearchController.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 11..
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var movieTable: UICollectionView!
    
    var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTable.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
    }
    
    
    @IBAction func searchButtonAction(_ sender: UITextField) {
        
        if let text = sender.text {
            viewModel.search(key: text)
            movieTable.reloadData()
        } else  {
            viewModel.searchMovies.removeAll()
            movieTable.reloadData()
        }
    }
}
extension SearchController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.searchMovies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        //        cell.movieImage.loadImage(url: viewModel.searchMovies[indexPath.item].backdropPath ?? "")
        cell.movieName.text = viewModel.searchMovies[indexPath.item].title ?? ""
        cell.movieRating.text = "\((viewModel.searchMovies[indexPath.item].voteAverage ?? 0)) / 10 IMDB"
        cell.movieDescription.text = viewModel.searchMovies[indexPath.item].overview ?? ""
        cell.movieImage.loadImage(url: viewModel.searchMovies[indexPath.item].backdropPath ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let controller = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsController") as! MovieDetailsController
            controller.selectedId = viewModel.searchMovies[indexPath.item].id
            navigationController?.show(controller, sender: nil)
        }
    }

