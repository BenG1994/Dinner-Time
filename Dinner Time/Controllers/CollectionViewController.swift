//
//  MealsViewController.swift
//  Dinner Time
//
//  Created by Ben Gauger on 2/21/23.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchBar.isHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        searchBar.isHidden = true
    }
    


}
