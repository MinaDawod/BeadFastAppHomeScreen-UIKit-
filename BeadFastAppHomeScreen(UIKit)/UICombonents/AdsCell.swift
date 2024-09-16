//
//  AdsCell.swift
//  BeadFastAppHomeScreen(UIKit)
//
//  Created by Mina Dawood on 11/09/2024.
//

import UIKit

class AdsCell: UICollectionViewCell {
    
    // Create the UIImageView
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 15 // Set corner radius to 15
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add the image view to the cell's content view
        contentView.addSubview(imageView)
        
        // Set up constraints for image view
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Optional: Configure the cell with an image
    func configure(with image: UIImage?) {
        imageView.image = image
    }
}
