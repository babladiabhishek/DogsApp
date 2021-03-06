//
//  DogCollectionViewCell.swift
//  DogsApps
//
//  Created by Abhishek babladi on 2022-03-30.
//

import UIKit
import Kingfisher

class DogCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var breedLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateLabel(cellViewModel: DogCellViewModel){
        breedLabel.text = cellViewModel.name
        imgView.kf.setImage(with: URL(string: cellViewModel.url))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        breedLabel.text = nil
        imgView.image = nil
    }
    
}

