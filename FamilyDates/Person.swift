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
    var birthDay: Date
    var event: String

    init(name: String, birthDay: Date, event: String) {
        self.name = name
        self.birthDay = birthDay
        self.event = event
    }
}
