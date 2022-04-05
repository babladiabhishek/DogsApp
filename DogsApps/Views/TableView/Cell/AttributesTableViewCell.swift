//
//  AttributesTableViewCell.swift
//  DogsApps
//
//  Created by Abhishek babladi on 2022-03-31.
//

import UIKit

class AttributesTableViewCell: UITableViewCell {
    @IBOutlet weak var bredForLabel: UILabel!
    @IBOutlet weak var lifeSpanLabel: UILabel!
    @IBOutlet weak var tempramentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateLabel(cellViewModel: AttributesCellViewModel){
        bredForLabel.text = cellViewModel.bredFor
        lifeSpanLabel.text = cellViewModel.lifeSpan
        tempramentLabel.text = cellViewModel.temperament
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bredForLabel.text = nil
        lifeSpanLabel.text = nil
        tempramentLabel.text = nil
    }
    
}
