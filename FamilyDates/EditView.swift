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
    @Bindable var person: Person
    var insert: Bool
    @Binding var isShowingEditView: Bool
    @State private var showingDatePicker = false

    var body: some View {
        @State var birthDayString:String? = dateFormatter.string(from: Date())
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
                    get: { dateFormatter.string(from: person.birthDay) },
                    set: { newValue in
                        if let date = dateFormatter.date(from: newValue) { person.birthDay = date }
                    }
                )).onTapGesture {
                    showingDatePicker.toggle()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                if showingDatePicker {
                    DatePicker("SELECT DATE",
                               selection: $person.birthDay,
                               displayedComponents: [.date]
                    )
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding()
                }
                Text("memo")
                    .font(.headline)
                    .padding(.leading)
                TextField("メモ", text:
                        .init(
                            get: { person.memo },
                            set: { person.memo = $0 }))
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
    let person = Person(name: "ichikawa", birthDay: Date(), memo: "還暦")
    @State var isShowingEditView = true
    @State var name = "ichikawa"
    @State var birthDay = Date()
    @State var memo = "還暦"
    return EditView(person: person, insert: true, isShowingEditView: $isShowingEditView)
}
