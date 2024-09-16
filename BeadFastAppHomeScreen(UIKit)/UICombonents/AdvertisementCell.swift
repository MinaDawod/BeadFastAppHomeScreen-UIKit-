//
//  AdvertisementCell.swift
//  BeadFastAppHomeScreen(UIKit)
//
//  Created by Mina Dawood on 14/09/2024.
//

import UIKit

class AdvertisementCell: UICollectionViewCell {
    
    // Create the UIImageView
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = 15
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add the image view to the content view
        contentView.addSubview(imageView)
        
        // Set up constraints to make the imageView fill the entire cell
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
    
    // Configure the cell with an image
    func configure(with image: UIImage?) {
        imageView.image = image
    }
}
