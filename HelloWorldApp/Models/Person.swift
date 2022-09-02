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
}

extension Person {
    static func getPersonList() -> [Person] {
        let dataManager = DataManager()
        var person = [Person]()
        
        for _ in 0 ..< dataManager.names.count {
            person.append(Person.init(name: dataManager.names.shuffled().randomElement() ?? "",
                                      surname: dataManager.surnames.shuffled().randomElement() ?? "",
                                      phone: dataManager.phones.shuffled().randomElement() ?? "",
                                      eMAil: dataManager.eMailes.shuffled().randomElement() ?? ""))
        }
        return person
    }
}


