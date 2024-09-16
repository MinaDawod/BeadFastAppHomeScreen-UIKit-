//
//  AppTapBar.swift
//  BeadFastAppHomeScreen(UIKit)
//
//  Created by Mina Dawood on 10/09/2024.
//

import UIKit

class AppTapBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the view controllers for each tab
        let homeVC = HomeViewController().wrapIntoNavigationController
        homeVC.view.backgroundColor = .white
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        // Hide the navigation bar for HomeViewController
        homeVC.navigationBar.isHidden = true
        
//        homeVC.navigationBar.isHidden = true
        
        let searchVC = SearchViewController().wrapIntoNavigationController
        searchVC.view.backgroundColor = .white
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        let cartVC = CartViewController().wrapIntoNavigationController
        cartVC.view.backgroundColor = .white
        cartVC.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 2)
        
        let payVC = PayViewController().wrapIntoNavigationController
        payVC.view.backgroundColor = .white
        payVC.tabBarItem = UITabBarItem(title: "Pay", image: UIImage(systemName: "creditcard"), tag: 3)
        
        let moreVC = MoreViewController().wrapIntoNavigationController
        moreVC.view.backgroundColor = .white
        moreVC.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "line.3.horizontal"), tag: 4)
        
        // Set view controllers
        self.viewControllers = [homeVC, searchVC, cartVC, payVC, moreVC]
        
        // Customize Tab Bar appearance
        tabBar.tintColor = UIColor.purple // Tab bar icon color when selected
        tabBar.barTintColor = UIColor.white // Tab bar background color
        tabBar.unselectedItemTintColor = UIColor.gray // Tab bar icon color when not selected
        
        // Add border to the tab bar
        let border = UIView()
        border.backgroundColor = UIColor.gray
        border.frame = CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 0.5)
        tabBar.addSubview(border)
    }
}

extension UIViewController {
    var wrapIntoNavigationController: UINavigationController {
        .init(rootViewController: self)
    }
}
