//
//  MoreViewController.swift
//  BeadFastAppHomeScreen(UIKit)
//
//  Created by Mina Dawood on 12/09/2024.
//

import UIKit
import RxSwift
import RxCocoa

class MoreViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let disposeBag = DisposeBag()
    
    // ViewModel instance
    var viewModel = MoreViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.layer.borderWidth = 1
        userImage.layer.cornerRadius = 27.5
        
        // Register the nib file for the collection view cell
        collectionView.register(UINib(nibName: "MoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MoreCollectionViewCell")
        
        // Bind the collection view with the ViewModel data
        bindCollectionView()
        
        // Setup layout if needed
        setupCollectionViewDelegate()
    }
    
    private func bindCollectionView() {
        // Bind ViewModel items to the collection view
        viewModel.items
            .drive(collectionView.rx.items(cellIdentifier: "MoreCollectionViewCell", cellType: MoreCollectionViewCell.self)) { row, item, cell in
                cell.configure(with: item.label, image: item.image)
            }
            .disposed(by: disposeBag)
        
        // Handle item selection
        collectionView.rx.modelSelected(MoreVCDataModel.MoreItem.self)
            .subscribe(onNext: { item in
                print("Selected item: \(item.label)")
            })
            .disposed(by: disposeBag)
    }
    
    private func setupCollectionViewDelegate() {
        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
}

// UICollectionViewDelegateFlowLayout extension for handling layout
extension MoreViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width  // Adjust for padding
        let height = width / 6 // Adjust height as needed
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // Smaller spacing between rows
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // No horizontal spacing since it's a single column
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Optional insets to add padding around the section
    }
}




