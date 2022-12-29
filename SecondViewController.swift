//
//  SecondViewController.swift
//  testLabelTabBarNav
//
//  Created by Леонид Шелудько on 28.12.2022.
//

import UIKit

class SecondViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView()
        
    }
    
    fileprivate func mainView() {
        self.view.backgroundColor = .white
        title = "Pustota"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        self.tabBarItem = tabBarItem
    }


}
