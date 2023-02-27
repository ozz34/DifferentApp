//
//  User.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 16.08.2022.
//

import UIKit

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "1",
            password: "1",
            person: Person.getPerson()
            )
    }
}

struct Person {
    let name: String
    let definition: String
    let picture: String
    
    static func getPerson() -> Person {
        Person(
            name: "Иван",
            definition: """
                        Всегда хотел развиваться в направлении Ios разработки, решил сменить
                        профессию. Из хобби - тренажерный зал и рыбалка, т.к. живу на Волге;)
                        """,
            picture: "flowers"
        )
    }
}
