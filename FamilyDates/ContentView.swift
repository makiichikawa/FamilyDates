//
//  ContentView.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/20.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var people: [Person]
    @State var isShowEditView = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                // Table view
                List {
                    HStack {
                        Text("名前").frame(width: 100, alignment: .leading)
                        Spacer()
                        Text("年齢").frame(width: 50, alignment: .leading)
                        Spacer()
                        Text("記念日").frame(width: 100, alignment: .leading)
                    }.font(.headline)
                    ForEach(people) { person in
                        NavigationLink(destination: ShowView(person: person)){
                            ListRow(name: person.name, age: person.computeAge(), event: person.event)
                        }
                    }
                    Button(action: {
                        isShowEditView = true
                    }){
                        Text("+").font(.title)
                    }.sheet(isPresented: $isShowEditView){
                        @State var name = ""
                        @State var birthDay = Date()
                        @State var event = ""
                        let person = Person(name: name, birthDay: birthDay, event: event)
                        EditView(person: person, insert: true, name: $name, birthDay: $birthDay, event: $event, isShowingEditView: $isShowEditView)
                    }
                }
            }.background(Color(UIColor.systemGray6))
        }
    }
}

#Preview {
    ContentView()
}
