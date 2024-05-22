//
//  People.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/22.
//

import SwiftUI

class People: ObservableObject {
    @Published var people = [
        Person(name: "自分", age: 36, event: "入学"),
        Person(name: "ten", age: 3, event: "還暦"),
        Person(name: "tino", age: 0, event: "誕生")
    ]
}
