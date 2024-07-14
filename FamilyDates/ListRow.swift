//
//  ListRow.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/22.
//

import SwiftUI

struct ListRow: View {
    let name: String
    let age: Int
    let event: String
    var body: some View {
        HStack {
            Text(name).frame(width: 100, alignment: .leading)
            Spacer()
            Text(age.description).frame(width: 50, alignment: .center)
            Spacer()
            Text(event).frame(width: 100, alignment: .leading)
        }
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

#Preview {
    ListRow(name: "自分", age: 36, event: "入学")
}
