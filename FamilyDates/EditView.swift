//
//  EditView.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/26.
//

import SwiftUI

struct EditView: View {
    @Binding var human: Person
    @Binding var isShowingEditView: Bool
    @State private var showingDatePicker = false

    var body: some View {
        VStack {
            NavigationBar()
            VStack(alignment: .leading) {
                Text("名前")
                    .font(.headline)
                    .padding(.leading)
                TextField("名前", text: $human.name)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                Text("誕生日")
                    .font(.headline)
                    .padding(.leading)
                
                TextField("SELECT DATE", text: Binding(
                    get: { dateFormatter.string(from: human.birthDay) },
                    set: { newValue in
                        if let date = dateFormatter.date(from: newValue) { human.birthDay = date }
                    }
                )).onTapGesture {
                    showingDatePicker.toggle()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                if showingDatePicker {
                    DatePicker("SELECT DATE",
                               selection: $human.birthDay,
                               displayedComponents: [.date]
                    )
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding()
                }
                Text("event")
                    .font(.headline)
                    .padding(.leading)
                TextField("できごと", text: $human.event)
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
                    isShowingEditView = false
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
    @State var human = Person(name: "ichikawa", birthDay: Date(), event: "還暦")
    @State var isShowingEditView = true
    return EditView(human: $human, isShowingEditView: $isShowingEditView)
}
