//
//  PersonListViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 31.08.2022.
//

import UIKit

final class PersonListViewController: UITableViewController {

    var persons: [Person]!
    
    // MARK: Override methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personList", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = persons[indexPath.row].fullName
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let infoOnePersonVC = segue.destination as? InfoOnePersonViewController else { return }
            infoOnePersonVC.person = persons[indexPath.row]
        }
    }
}
