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
                        Мой хороший друг - тех.дир - программист убедил меня
                        пойти в программирование, теперь и я учусь, решил сменить
                        профессию. Из хобби - зал полупрофессионально в отдельных
                        направлениях и рыбалка, т.к. живу на Волге и рядом
                        Астрахань;)
                        """,
            picture: "flowers"
        )
    }
}


