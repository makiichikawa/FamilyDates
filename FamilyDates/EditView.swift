//
//  EditView.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/26.
//

import SwiftUI
import SwiftData

struct EditView: View {
    @Environment(\.modelContext) private var context
    var person: Person
    var insert: Bool
    @Binding var name: String
    @Binding var birthDay: Date
    @Binding var event: String
    @Binding var isShowingEditView: Bool
    @State private var showingDatePicker = false

    var body: some View {
        VStack {
            NavigationBar()
            VStack(alignment: .leading) {
                Text("名前")
                    .font(.headline)
                    .padding(.leading)
                TextField("名前", text:
                        .init(
                            get: { person.name },
                            set: { person.name = $0 }
                        ))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                Text("誕生日")
                    .font(.headline)
                    .padding(.leading)
                
                TextField("SELECT DATE", text: Binding(
                    get: { dateFormatter.string(from: birthDay) },
                    set: { newValue in
                        if let date = dateFormatter.date(from: newValue) { birthDay = date }
                    }
                )).onTapGesture {
                    showingDatePicker.toggle()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                if showingDatePicker {
                    DatePicker("SELECT DATE",
                               selection: $birthDay,
                               displayedComponents: [.date]
                    )
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding()
                }
                Text("event")
                    .font(.headline)
                    .padding(.leading)
                TextField("できごと", text:
                        .init(
                            get: { person.event },
                            set: { person.event = $0 }))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
            }.padding()

            Spacer()

            HStack {
                Button("CANCEL") {
                    isShowingEditView = false
                }
                .padding()

                Spacer()

                Button("OK") {
                    if (insert) {
                        context.insert(person)
                    } else {
                        isShowingEditView = false
                        name = person.name
                        birthDay = person.birthDay
                        event = person.event
                        try? context.save()
                    }
                }
                .padding()
            }
            .padding(.horizontal)
        }
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

#Preview {
    var person = Person(name: "ichikawa", birthDay: Date(), event: "還暦")
    @State var isShowingEditView = true
    @State var name = "ichikawa"
    @State var birthDay = Date()
    @State var event = "還暦"
    return EditView(person: person, insert: true, name: $name, birthDay: $birthDay, event: $event, isShowingEditView: $isShowingEditView)
}
