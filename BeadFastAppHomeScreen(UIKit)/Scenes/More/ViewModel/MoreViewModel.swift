//
//  MoreViewModel.swift
//  BeadFastAppHomeScreen(UIKit)
//
//  Created by Mina Dawood on 12/09/2024.
//

import UIKit
import RxSwift
import RxCocoa

class MoreViewModel {
    
    // Outputs
    let items: Driver<[MoreVCDataModel.MoreItem]>
    
    // DisposeBag for RxSwift
    private let disposeBag = DisposeBag()
    
    init() {
        // Dummy data for demonstration
        let dummyData = [
            MoreVCDataModel.MoreItem(label: "Activity History", image: UIImage(systemName: "book.pages") ?? UIImage()),
            MoreVCDataModel.MoreItem(label: "Favorites", image: UIImage(systemName: "heart") ?? UIImage()),
            MoreVCDataModel.MoreItem(label: "Breadfast Rewards", image: UIImage(systemName: "trophy") ?? UIImage()),
            MoreVCDataModel.MoreItem(label: "Free credit", image: UIImage(systemName: "gift") ?? UIImage()),
            MoreVCDataModel.MoreItem(label: "Account Settings", image: UIImage(systemName: "gearshape") ?? UIImage()),
            MoreVCDataModel.MoreItem(label: "Help", image: UIImage(systemName: "questionmark.circle") ?? UIImage()),
            MoreVCDataModel.MoreItem(label: "Language", image: UIImage(systemName: "globe") ?? UIImage()),
            MoreVCDataModel.MoreItem(label: "Country", image: UIImage(systemName: "flag") ?? UIImage()),
            MoreVCDataModel.MoreItem(label: "Talk to us", image: UIImage(systemName: "ellipsis.message") ?? UIImage()),
        ]
        
        // Provide the data as a Driver to ensure thread safety and UI binding
        self.items = Observable.just(dummyData)
            .asDriver(onErrorJustReturn: [])
    }
}
