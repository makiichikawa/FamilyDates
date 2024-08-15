//
//  People.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/22.
//

import SwiftUI

class People: ObservableObject {
    @Published var people = [
        Person(name: "自分", birthDay: Date() , memo: "入学"),
        Person(name: "ten", birthDay: Date(), memo: "還暦"),
        Person(name: "tino", birthDay: Date(), memo: "誕生")
    ]
}
