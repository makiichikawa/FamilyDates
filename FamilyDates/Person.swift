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
    var memo: String

    init(name: String, birthDay: Date, memo: String) {
        self.name = name
        self.birthDay = birthDay
        self.memo = memo
    }

    func computeAge() -> Int {
        let calendar = Calendar.current
        let birthday = calendar.dateComponents(in: TimeZone.current, from: self.birthDay)
        let now = calendar.dateComponents([.year, .month, .day], from: Date())
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        return ageComponents.year!
    }

    func getAnniversary() -> String {
        let urlComponents = URLComponents(string:  "https://holidays-jp.github.io/api/v1/date.json")!
        Task {
            let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200,
//               let anniversaryJson = String(data: data, encoding: .utf8) {
//                  print(anniversaryJson)
//               }
               let anniversaryJson = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                 print(anniversaryJson)
               }
        }
        return ""
    }
}
