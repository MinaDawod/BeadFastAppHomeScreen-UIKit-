//
//  ExploreCell.swift
//  BeadFastAppHomeScreen(UIKit)
//
//  Created by Mina Dawood on 11/09/2024.
//

import UIKit

class ExploreCell: UICollectionViewCell {
    
    // Create the UIImageView
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    // Create the UILabel
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .black // Customize this color as needed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Set corner radius for the entire cell
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true // This ensures the content stays within the rounded corners
    
        // Add the image view and label to the content view
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        // Set up constraints for image view (filling the entire cell)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        // Set up constraints for title label (centered at the top of the image view)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8), // Top padding
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30) // Adjust as necessary
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Optional: Configure the cell with image and label
    func configure(with image: UIImage?, title: String?) {
        imageView.image = image
        titleLabel.text = title
    }
}
