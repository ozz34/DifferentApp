//
//  TabBarViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 13.09.2022.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        guard let personListVC = viewControllers?.first as? PersonListViewController else { return }
        guard let fullInformationVC = viewControllers?.last as? FullInformationViewController else { return }
        
        let persons = Person.getPersonList()
        personListVC.persons = persons
        fullInformationVC.persons = persons
    }
}
