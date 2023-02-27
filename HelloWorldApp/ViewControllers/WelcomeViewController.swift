//
//  SecondViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 12.08.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.person.name)!"
    }
}
