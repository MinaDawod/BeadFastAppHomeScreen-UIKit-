//
//  HomeViewController.swift
//  BeadFastAppHomeScreen(UIKit)
//
//  Created by Mina Dawood on 10/09/2024.
//

import UIKit


class HomeViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Data Model
      let dataModel = DataModel()
//      let disposeBag = DisposeBag()
      
      override func viewDidLoad() {
          super.viewDidLoad()
          
          // Set the data source and delegate
          collectionView.dataSource = self
          collectionView.delegate = self
          
          collectionView.register(CommercialCell.self, forCellWithReuseIdentifier: "CommercialCell")
          collectionView.register(SpotlightCell.self, forCellWithReuseIdentifier: "SpotlightCell")
          collectionView.register(ExploreCell.self, forCellWithReuseIdentifier: "ExploreCell")
          collectionView.register(AdsCell.self, forCellWithReuseIdentifier: "AdsCell")

          collectionView.register(UINib(nibName: "TopPicksCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopPicksCollectionViewCell")
          
          // Register header
          collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
          
          // Setup layout
          collectionView.collectionViewLayout = createLayout()
      }
    
      // Create a compositional layout for the collection view
      func createLayout() -> UICollectionViewLayout {
          let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
              switch sectionIndex {
                  
              case 0:
                  // Spotlight Section
                  let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(1.0))
                  let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                  item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

                  
                  let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.3))
                  let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                  
                  let section = NSCollectionLayoutSection(group: group)
                  section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                  section.orthogonalScrollingBehavior = .continuous // Allows horizontal scrolling

                  return section
                  
              case 1:
                  // Spotlight Section
                  let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(1.0))
                  let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                  item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

                  
                  let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.2))
                  let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                  
                  let section = NSCollectionLayoutSection(group: group)
                  section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 10)
                  section.orthogonalScrollingBehavior = .continuous // Allows horizontal scrolling
                  
                  // Add header
                  let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                  let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                  section.boundarySupplementaryItems = [header]
                  
                  return section
                  
              case 2: // Top Picks Section
                  // Define the item size to make sure it fits within the group's width without extra space
                  let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.333), heightDimension: .fractionalHeight(1.0))
                  let item = NSCollectionLayoutItem(layoutSize: itemSize)
                  item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
                  
                  // Define the group size to match the full width
                  let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.35))
                  let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                                    
                  // Set the section with continuous scrolling behavior
                  let section = NSCollectionLayoutSection(group: group)
                  section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10) // Section insets
                  section.orthogonalScrollingBehavior = .continuous // Continuous horizontal scrolling
                  
                  // Set gray background for the section
                  section.decorationItems = [
                      NSCollectionLayoutDecorationItem.background(elementKind: "grayBackground")
                  ]
                  
                  // Add a header
                  let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                  let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                  section.boundarySupplementaryItems = [header]
                  
                  return section
                  
              case 3:
                  // Explore Section
                  let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(180))
                  let item = NSCollectionLayoutItem(layoutSize: itemSize)
                  item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0)

                  
                  let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(180))
                  let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                  
                  let section = NSCollectionLayoutSection(group: group)
                  section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                  
                  // Add header
                  let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                  let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                  section.boundarySupplementaryItems = [header]
                  
                  return section
                  
              default:
                  return nil
              }
          }
          // Register the decoration view
              layout.register(GrayBackgroundDecorationView.self, forDecorationViewOfKind: "grayBackground")
              
          return layout
      }
  }

  extension HomeViewController: UICollectionViewDataSource {
      
      func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 4 // Spotlight, Top Picks, Explore
      }
      
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          switch section {
              
          case 0:
              return dataModel.commercialItems.value.count
          case 1:
              return dataModel.spotlightItems.value.count
          case 2:
              return dataModel.topPicksItems.value.count
          case 3:
              return dataModel.exploreItems.value.count
          default:
              return 0
          }
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          switch indexPath.section {
              
          case 0:
              // Dequeue CommercialCell
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommercialCell", for: indexPath) as! CommercialCell
              let commercialItem = dataModel.commercialItems.value[indexPath.item]
              cell.configure(with: commercialItem.image)
              return cell
              
          case 1:
              // Dequeue SpotlightCell
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpotlightCell", for: indexPath) as! SpotlightCell
              let image = dataModel.spotlightItems.value[indexPath.item]
              cell.configure(with: image)
              return cell
              
          case 2:
              // Dequeue TopPicksCollectionViewCell
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopPicksCollectionViewCell", for: indexPath) as! TopPicksCollectionViewCell
              let topPick = dataModel.topPicksItems.value[indexPath.item]
              
              // Safely unwrap the optional image
              if let image = topPick.image {
                  cell.itemImage.image = image
              } else {
                  cell.itemImage.image = UIImage(named: "placeholder") // Use a placeholder image if image is nil
              }
              
              // Safely unwrap and display the price and description
              cell.itemPrice.text = String(format: "$%.2f", topPick.price ?? 0.0)
              cell.itemDescription.text = topPick.description ?? "No description available"
              
              return cell

          case 3:
              // Dequeue ExploreCell
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCell", for: indexPath) as! ExploreCell
              let explore = dataModel.exploreItems.value[indexPath.item]
              cell.configure(with: explore.image, title: explore.label)
              return cell

          default:
              return UICollectionViewCell()
          }
      }
      
      func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
          if kind == UICollectionView.elementKindSectionHeader {
              let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
              
              // Set the title for each section
              switch indexPath.section {
              case 0:
                  headerView.titleLabel.text = ""
              case 1:
                  headerView.titleLabel.text = "The Spotlight"
              case 2:
                  headerView.titleLabel.text = "Top Picks For You"
              case 3:
                  headerView.titleLabel.text = "Explore Breadfast"
              default:
                  headerView.titleLabel.text = ""
              }
              
              // Add action for "View All" button (optional)
              headerView.viewAllButton.addTarget(self, action: #selector(viewAllButtonTapped), for: .touchUpInside)
              
              return headerView
          }
          
          return UICollectionReusableView()
      }
      
      @objc func viewAllButtonTapped() {
          print("View All button tapped")
      }
  }


class GrayBackgroundDecorationView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6 // Gray background color
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
