//
//  ContentView.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var Family = People()
    var body: some View {
        VStack {
            // Navigation bar
            HStack {
                Image(systemName: "line.horizontal.3")
                Spacer()
                Text("Family Dates").font(.headline)
                Spacer()
                Image(systemName: "house")
                Image(systemName: "ellipsis")
            }.padding().background(Color(UIColor.systemGray6))
            // Table view
            List {
                HStack {
                    Text("名前").frame(width: 100, alignment: .leading)
                    Spacer()
                    Text("年齢").frame(width: 50, alignment: .center)
                    Spacer()
                    Text("記念日").frame(width: 100, alignment: .leading)
                }.font(.headline)
                ForEach(Family.people) { person in
                    ListRow(name: person.name, age: person.age, event: person.event)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
