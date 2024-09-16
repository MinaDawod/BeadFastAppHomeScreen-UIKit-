//
//  HeaderView.swift
//  BeadFastAppHomeScreen(UIKit)
//
//  Created by Mina Dawood on 11/09/2024.
//

import UIKit

class HeaderView: UICollectionReusableView {

    let titleLabel = UILabel()
    let viewAllButton = UIButton(type: .system)

    override init(frame: CGRect) {
         super.init(frame: frame)
         
         // Set up titleLabel
         titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold) // Increased font size
         titleLabel.textColor = .black
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         addSubview(titleLabel)

         // Set up viewAllButton
         viewAllButton.setTitle("View All", for: .normal)
         viewAllButton.setTitleColor(UIColor.purple, for: .normal) // Set title color to purple
         viewAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium) // Set font size
         viewAllButton.translatesAutoresizingMaskIntoConstraints = false

         // Add the arrow image to the button
         let arrowImage = UIImage(systemName: "chevron.right") // Replace with your image name
         viewAllButton.setImage(arrowImage, for: .normal)
         viewAllButton.imageView?.contentMode = .scaleAspectFit
         viewAllButton.tintColor = UIColor.purple // Ensure the image color matches the button color

         // Ensure the image is to the right of the text
         viewAllButton.semanticContentAttribute = .forceRightToLeft
         
         // Add some spacing between the text and the image
         viewAllButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
         viewAllButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)

         addSubview(viewAllButton)

         // Add constraints
         NSLayoutConstraint.activate([
             titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
             titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

             viewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
             viewAllButton.centerYAnchor.constraint(equalTo: centerYAnchor)
         ])
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
