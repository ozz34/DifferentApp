//
//  PersonListViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 31.08.2022.
//

import UIKit

final class PersonListViewController: UITableViewController {

    private let person = Person.getPersonList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        navigationItem.title = "sdsadasdasda"
//        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Override methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(person[indexPath.row].name) \(person[indexPath.row].surname)"
        cell.contentConfiguration = content

        return cell
    }



   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personallityVC = segue.destination as? PersonalittyViewController else { return }
        personallityVC.person = person
        
    }
}
