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
            Text(String(age)).frame(width: 50, alignment: .center)
            Spacer()
            Text(event).frame(width: 100, alignment: .leading)
        }
    }
}

#Preview {
    ListRow(name: "自分", age: 36, event: "入学")
}
