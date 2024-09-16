//
//  MoreCollectionViewCell.swift
//  BeadFastAppHomeScreen(UIKit)
//
//  Created by Mina Dawood on 13/09/2024.
//

import UIKit

class MoreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(with label: String, image: UIImage) {
        cellImage.image = image
        cellLabel.text = label
    }
}
