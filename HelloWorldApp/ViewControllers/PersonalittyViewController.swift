//
//  PersonalittyViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 31.08.2022.
//

import UIKit

class PersonalittyViewController: UIViewController {
    
    @IBOutlet var fullNameLAbel: UILabel!
    
   

    @IBOutlet var phoneLabel: UILabel!
    
    @IBOutlet var eMailLabel: UILabel!
    
    var person: [Person]!
    override func viewDidLoad() {
        super.viewDidLoad()

        fullNameLAbel.text = pe
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
