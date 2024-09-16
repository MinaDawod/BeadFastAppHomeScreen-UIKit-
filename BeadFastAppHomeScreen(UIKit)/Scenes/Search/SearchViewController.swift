//
//  SearchViewController.swift
//  BeadFastAppHomeScreen(UIKit)
//
//  Created by Mina Dawood on 12/09/2024.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.layer.borderWidth = 1
        headerView.layer.borderColor = UIColor.systemGray6.cgColor
    }

}
