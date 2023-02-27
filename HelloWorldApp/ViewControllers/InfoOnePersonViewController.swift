//
//  PersonalittyViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 31.08.2022.
//

import UIKit

final class InfoOnePersonViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var eMailLabel: UILabel!
    
    var person: Person!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        fullNameLabel.text = person.fullName
        phoneLabel.text = person.phone
        eMailLabel.text = person.eMAil
    }
}
