//
//  Person.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 31.08.2022.
//

struct Person {
    let name: String
    let surname: String
    let phone: String
    let eMAil: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Person {
    static func getPersonList() -> [Person] {
        let dataManager = DataManager.shared
        var persons = [Person]()
        
        let names = dataManager.names.shuffled()
        let surnames = dataManager.surnames.shuffled()
        let phones = dataManager.phones.shuffled()
        let eMailes = dataManager.eMailes.shuffled()
        
        
        let iterationCount = min(
            names.count,
            surnames.count,
            phones.count,
            eMailes.count
        )
        
        for index in 0 ..< iterationCount {
            persons.append(Person(name: names[index],
                                  surname: surnames [index],
                                  phone: phones[index],
                                  eMAil: eMailes[index]
                                 )
            )
        }
        return persons
    }
}



