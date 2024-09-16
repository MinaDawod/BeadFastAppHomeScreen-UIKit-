//
//  PayViewController.swift
//  BeadFastAppHomeScreen(UIKit)
//
//  Created by Mina Dawood on 14/09/2024.
//

import UIKit

class PayViewController: UIViewController, UICollectionViewDelegate {
        
    @IBOutlet weak var savedCardsBtn: UIButton!
    @IBOutlet weak var addToBalanceBtn: UIButton!
    @IBOutlet weak var payCollectionView: UICollectionView!
    
    private let dataModel = PayVCDataModel()
    
    private var addsImages: [PayVCDataModel.addImage] = []
    private var paymentServices: [PayVCDataModel.PaymentService] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI Setup
        savedCardsBtn.layer.cornerRadius = 22.5
        addToBalanceBtn.layer.cornerRadius = 22.5
        
        // Set the data source and delegate
        payCollectionView.dataSource = self
        payCollectionView.delegate = self
        
        payCollectionView.register(AdvertisementCell.self, forCellWithReuseIdentifier: "AdvertisementCell")
        payCollectionView.register(ServiceCell.self, forCellWithReuseIdentifier: "ServiceCell")
        
        // Register header
        payCollectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
        
        // Setup layout
        payCollectionView.collectionViewLayout = createLayout()
        
        // Initialize data
        initializeData()
    }
    
    private func initializeData() {
        addsImages = [
            PayVCDataModel.addImage(image: UIImage(named: "Gaza") ?? UIImage()),
            PayVCDataModel.addImage(image: UIImage(named: "Tod") ?? UIImage()),
            PayVCDataModel.addImage(image: UIImage(named: "Pubg") ?? UIImage())
        ]
        
        paymentServices = [
            PayVCDataModel.PaymentService(serviceLabel: "Mobile Bill", image: UIImage(named: "MobileBill") ?? UIImage()),
            PayVCDataModel.PaymentService(serviceLabel: "Gaming", image: UIImage(named: "Gaming") ?? UIImage()),
            PayVCDataModel.PaymentService(serviceLabel: "Electricity", image: UIImage(named: "Elcto") ?? UIImage()),
            PayVCDataModel.PaymentService(serviceLabel: "DSL", image: UIImage(named: "Router") ?? UIImage()),
            PayVCDataModel.PaymentService(serviceLabel: "TV Subscription", image: UIImage(named: "TVzz") ?? UIImage()),
            PayVCDataModel.PaymentService(serviceLabel: "Gas Bills", image: UIImage(named: "Gass") ?? UIImage()),
            PayVCDataModel.PaymentService(serviceLabel: "Donations", image: UIImage(named: "Donation") ?? UIImage())
        ]
    }
    
    // Create a compositional layout for the collection view
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
                
            case 0:
                // Spotlight Section
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.3))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                section.orthogonalScrollingBehavior = .continuous // Allows horizontal scrolling
                
                return section
                
            case 1:
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
        
        return layout
    }
}

extension PayViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // Adjusted to reflect actual sections in the layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
            
        case 0:
            return addsImages.count
        case 1:
            return paymentServices.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        case 0:
            // Dequeue AdvertisementCell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvertisementCell", for: indexPath) as! AdvertisementCell
            let addItem = addsImages[indexPath.item]
            cell.configure(with: addItem.image)
            return cell
            
        case 1:
            // Dequeue ServiceCell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
            let serviceItem = paymentServices[indexPath.item]
            cell.configure(with: serviceItem.image, title: serviceItem.serviceLabel)
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
                headerView.titleLabel.text = "Payment Services"
            default:
                headerView.titleLabel.text = ""
            }
            
            return headerView
        }
        
        return UICollectionReusableView()
    }
}


