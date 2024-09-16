//
//  DataModel.swift
//  BeadFastAppHomeScreen(UIKit)
//
//  Created by Mina Dawood on 11/09/2024.
//

import UIKit
import RxRelay

struct DataModel {
    
    // Structs representing individual data types
    struct SpotlightItem {
        var image: [UIImage?]
    }
    
    struct TopPicksItem {
        var image: UIImage?
        var price: Double?
        var description: String?
    }
    
    struct ExploreItem {
        var label: String?
        var image: UIImage?
    }
    
    struct CommercialItem {
        var image: UIImage?
    }
    
    // Data models for each section (rename the variables to avoid ambiguity)
     let spotlightItems = BehaviorRelay<[UIImage]>(value: [])
     let topPicksItems = BehaviorRelay<[TopPicksItem]>(value: [])
     let exploreItems = BehaviorRelay<[ExploreItem]>(value: [])
     let commercialItems = BehaviorRelay<[CommercialItem]>(value: [])

    
    init() {
        // Initialize Spotlight data with multiple images
        spotlightItems.accept([
            UIImage(named: "juhayna")!,
            UIImage(named: "oboorLand")!,
            UIImage(named: "rogina")!,
            UIImage(named: "noodles")!
        ])
        
        // Initialize Top Picks data with multiple items
        topPicksItems.accept([
            TopPicksItem(image: UIImage(named: "breadBag")!, price: 19.99, description: "12 pieces Bread Bag"),
            TopPicksItem(image: UIImage(named: "bimoliOil")!, price: 29.99, description: "100 ml coockin oil"),
            TopPicksItem(image: UIImage(named: "cheddarCheese")!, price: 19.99, description: "16 slices cheddar cheese"),
            TopPicksItem(image: UIImage(named: "heinzMustard")!, price: 29.99, description: "Heinaz Mustard"),
            TopPicksItem(image: UIImage(named: "breadBag")!, price: 39.99, description: "12 pieaces bread bag"),
            TopPicksItem(image: UIImage(named: "TomatoSauce")!, price: 39.99, description: "Tomato Sauce")
        ])
        
        // Initialize Explore data with multiple label-image pairs
        exploreItems.accept([
            ExploreItem(label: "Beverages", image: UIImage(named: "Explore1")!),
            ExploreItem(label: "Sweets & Candy", image: UIImage(named: "Sweets & Candy")!),
            ExploreItem(label: "Donuts", image: UIImage(named: "Donuts")!),
            ExploreItem(label: "Vouchers", image: UIImage(named: "Vouchers")!),
            ExploreItem(label: "Fruits", image: UIImage(named: "Fruits")!),
            ExploreItem(label: "Vegetables", image: UIImage(named: "Vegetables")!)
        ])
        
        // Initialize Commercial data
        commercialItems.accept([
            CommercialItem(image: UIImage(named: "Molto")!),
            CommercialItem(image: UIImage(named: "twinkies")!),
            CommercialItem(image: UIImage(named: "AuAuf")!),
            CommercialItem(image: UIImage(named: "juhayna")!)
        ])
    }
}
