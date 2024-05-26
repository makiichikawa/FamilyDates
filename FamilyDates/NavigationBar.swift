//
//  NavigationBar.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/25.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
            Spacer()
            Text("Family Dates").font(.headline)
            Spacer()
            Image(systemName: "house")
            Image(systemName: "ellipsis")
        }.padding().background(Color(UIColor.systemGray6))
    }
}

#Preview {
    NavigationBar()
}
