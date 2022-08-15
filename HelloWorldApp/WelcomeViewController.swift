//
//  SecondViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 12.08.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        welcomeLabel.text = "Welcome, \(userName ?? "")"
    }
}
