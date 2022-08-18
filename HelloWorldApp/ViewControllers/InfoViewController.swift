//
//  InfoViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 16.08.2022.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var picture: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Привет! Меня зовут \(user.person.name)."
        descriptionLabel.text = user.person.definition
        picture.image = UIImage(named: user.person.picture) 
    }
}

