//
//  StartViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 23.08.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setupBackground(for color: UIColor)
}

final class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        
        settingsVC.color = self.view.backgroundColor
        settingsVC.delegate = self
    }
}

extension StartViewController: SettingsViewControllerDelegate {
    func setupBackground(for color: UIColor) {
        self.view.backgroundColor = color
    }
}
