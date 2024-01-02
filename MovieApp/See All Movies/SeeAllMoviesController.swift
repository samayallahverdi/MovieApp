//
//  SeeAllMoviesController.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 19..
//

import UIKit

class SeeAllMoviesController: UIViewController {
    
    @IBOutlet weak var seeAllCollection: UICollectionView!
    
    var viewModel = SeeAllMoviesViewModel()
    var selectedCategory: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        seeAllCollection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
}
// MARK: - UI Configuration

extension SeeAllMoviesController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
        cell.titleLabel.text = viewModel.movies[indexPath.item].title
        cell.topImage.loadImage(url: viewModel.movies[indexPath.item].backdropPath ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          .init(width: collectionView.frame.width/2-10, height: 250)
      }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsController") as! MovieDetailsController
        controller.selectedId = viewModel.movies[indexPath.item].id
        navigationController?.show(controller, sender: nil)
    }
}

// MARK: - Configuration

extension SeeAllMoviesController {
    func viewConfiguration() {
        viewModel.getMovies(selectedCategory: selectedCategory ?? "")
        viewModel.error = { errorMessage in
            print(errorMessage)
        }
        viewModel.success = {
            self.seeAllCollection.reloadData()
        }
    }
    
}
