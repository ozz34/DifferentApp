//
//  DataManager.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 31.08.2022.
//

final class DataManager {
    
    static let shared = DataManager()
    
    let names = ["John", "Sharon", "Aaron",
                 "Steven", "Nicola", "Ted",
                 "Bruce", "Carl", "Allan"]
    let surnames = ["Murphy", "Jankin", "Williams",
                    "Black", "Robertson", "Butler",
                    "Isaacson", "Smith", "Pennyworth"]
    let phones = ["64578324","76547734","12666331",
                  "56323424","567567567","97373463",
                  "64534632", "252253235", "5674676734"]
    let eMailes = ["www.123@mail.ru", "www.456@mail.ru",
                   "www.789@mail.ru","www.102@mail.ru",
                   "www.563@mail.ru","www.277@mail.ru",
                   "www.896@mail.ru","www.540@mail.ru",
                   "www.110@mail.ru"]
   
    private init() {}
}
