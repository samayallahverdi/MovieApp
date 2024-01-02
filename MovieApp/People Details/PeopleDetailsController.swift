//
//  PeopleDetailsController.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 16..
//

import UIKit

class PeopleDetailsController: UIViewController {
    
    @IBOutlet weak var peopleDetailsCollection: UICollectionView!
    
    var selectedId = 0
    var viewModel = PeopleDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelConfig()
        registerXib()
    }
    
    func viewModelConfig() {
        viewModel.getPeopleDetails(peopleId: selectedId)
        viewModel.error = { errorMessage in
            print(errorMessage)
        }
        viewModel.success = {
            self.peopleDetailsCollection.reloadData()
            print(self.viewModel.peopleDetails)
        }
    }
    func registerXib(){
        peopleDetailsCollection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
}
extension PeopleDetailsController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.peopleDetails.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
        cell.titleLabel.text = viewModel.peopleDetails[indexPath.item].title
        cell.topImage.loadImage(url: viewModel.peopleDetails[indexPath.item].backdropPath ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2 - 10, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsController") as! MovieDetailsController
        controller.selectedId = viewModel.peopleDetails[indexPath.item].id
        navigationController?.show(controller, sender: nil)
    }
}


