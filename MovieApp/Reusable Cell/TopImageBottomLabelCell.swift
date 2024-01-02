//
//  TopImageBottomLabelCell.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 07..
//

import UIKit

protocol TopImageBottomLabelCellProtocol {
    var titleText: String {get}
    var imagePath: String {get}
}

class TopImageBottomLabelCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topImage.layer.cornerRadius = 16
    }
    func configure(data: TopImageBottomLabelCellProtocol) {
        titleLabel.text = data.titleText
        topImage.loadImage(url: data.imagePath)
    }
}
