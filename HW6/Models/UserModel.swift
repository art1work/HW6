//
//  Model.swift
//  HW6
//
//  Created by Артём Ермохин on 06.07.2022.
//


struct User {
    let name: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            name: "User",
            password: "123",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let image: String
    let infoText: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(
            name: "Artyom",
            surname: "Ermokhin",
            image: "photo",
            infoText: """
            Самый классный текст про то, как я приеду к Сонечке 23го числа и буду её обнимать сто часов подряд
            """
        )
    }
}


