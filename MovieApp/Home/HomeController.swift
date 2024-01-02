//
//  HomeController.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 04..
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var homeTable: UICollectionView!
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
        configureUI()
    }
    func configureUI() {
        title = "Movies"
        homeTable.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
    }
    func configureViewModel() {
        viewModel.getItems()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
            
        }
        viewModel.success = {
            self.homeTable.reloadData()
            
        }
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SearchController") as! SearchController
        navigationController?.show(controller, sender: nil)
    }
}
// MARK: - UI Configuration

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.cellDelegate = self
        cell.buttonDelegate = self
        let item = viewModel.movies[indexPath.item]
        cell.configure(title: item.title, movies: item.movies)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 288)
    }
}

// MARK: - Protocol

extension HomeController: HomeCellDelegate {
    func didSelectMovie(at index: Int) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsController") as! MovieDetailsController
        controller.selectedId = index
        print("\(index) testttttt")
        navigationController?.show(controller, sender: nil)
    }
}
extension HomeController: SeeAllButtonDelegate {
    func seeAllButtonAction(category: String) {
               let controller = storyboard?.instantiateViewController(withIdentifier: "SeeAllMoviesController") as! SeeAllMoviesController
        switch (category) {
               case "Now Playing":
                   controller.selectedCategory = "movie/now_playing"
               case "Popular":
                   controller.selectedCategory = "movie/popular"
               case "Top Rated":
                   controller.selectedCategory = "movie/top_rated"
               default:
                   controller.selectedCategory = "movie/upcoming"
               }
               navigationController?.show(controller, sender: nil)
           }
       }

