//
//  Person.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/22.
//

import SwiftUI

struct Person: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var age: Int
    var event: String

    init(name: String, age: Int, event: String) {
        self.name = name
        self.age = age
        self.event = event
    }
}
