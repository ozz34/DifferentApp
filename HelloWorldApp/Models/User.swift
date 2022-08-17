//
//  User.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 16.08.2022.
//

struct User {
     
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(login: "ozz",
             password: "123321",
             person: Person(
            name: "Ivan",
            definition: """
                        Мой хороший друг - тех.дир - программист меня убедил
                        пойти в программирование, теперь и я учусь, решил сменить
                        профессию. Из хобби - зал полупрофессионально в отдельных
                        направлениях и рыбалка, т.к. живу на Волге и рядом
                        Астрахань;
                        """))
    }
}

struct Person {
    let name: String
    let definition: String
}
