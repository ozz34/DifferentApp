//
//  SecondViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 17.08.2022.
//

import UIKit

class SecondViewController: UIViewController {
    var user: User!
    
    override func viewDidLoad() {
        self.title = user.person.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoVC = segue.destination as? InfoViewController else { return }
                infoVC.user = user
    }
}
