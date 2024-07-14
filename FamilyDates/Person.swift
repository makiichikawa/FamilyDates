//
//  Person.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/22.
//

import Foundation
import SwiftData

@Model
final class Person {

    let id = UUID()
    var name: String
    var birthDay: Date
    var event: String

    init(name: String, birthDay: Date, event: String) {
        self.name = name
        self.birthDay = birthDay
        self.event = event
    }

    func computeAge() -> Int {
        let calendar = Calendar.current
        let birthday = calendar.dateComponents(in: TimeZone.current, from: self.birthDay)
        let now = calendar.dateComponents([.year, .month, .day], from: Date())
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        return ageComponents.year!
    }
}
