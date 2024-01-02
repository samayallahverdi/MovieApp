//
//  PeopleController.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 08..
//

import UIKit

class PeopleController: UIViewController {
    
    @IBOutlet weak var peopleTable: UICollectionView!
    
    var viewModel = PeopleViewModel()
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
        
    }
    func configureUI() {
        title = "Actors"
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        peopleTable.refreshControl = refreshControl
        peopleTable.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
    func configureViewModel() {
        viewModel.getPopleList()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
            
        }
        viewModel.success = {
            self.peopleTable.reloadData()
            
        }
    }
    @objc func pullToRefresh() {
        viewModel.reset()
        peopleTable.reloadData()
        viewModel.getPopleList()
    }
}
extension PeopleController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "PeopleDetailsController") as! PeopleDetailsController
        controller.selectedId = viewModel.items[indexPath.item].id ?? 0
        navigationController?.show(controller, sender: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2 - 10, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.item)
    }
}
