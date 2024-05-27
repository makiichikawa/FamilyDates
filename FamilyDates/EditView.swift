//
//  EditView.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/26.
//

import SwiftUI

struct EditView: View {
    @State private var name: String = ""
    @State private var selectedDate = Date()
    @State private var showingDatePicker = false
    

    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                VStack(alignment: .leading) {
                    Text("名前")
                        .font(.headline)
                        .padding(.leading)
                    TextField("名前", text: $name)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray, lineWidth: 1))
                        .padding(.horizontal)

                    Text("誕生日")
                        .font(.headline)
                        .padding(.leading)
                    
                    TextField("SELECT DATE", text: Binding(
                        get: { dateFormatter.string(from: selectedDate) },
                        set: { newValue in
                            if let date = dateFormatter.date(from: newValue) { selectedDate = date }
                        }
                    )).onTapGesture {
                        showingDatePicker.toggle()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                    if showingDatePicker {
                        DatePicker("SELECT DATE",
                                   selection: $selectedDate,
                                   displayedComponents: [.date]
                        )
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .padding()
                    }
                }.padding()
                
                Spacer()
                
                HStack {
                    Button("CANCEL") {
                        // Handle cancel action
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button("OK") {
                        // Handle OK action
                    }
                    .padding()
                }
                .padding(.horizontal)
            }
        }
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

#Preview {
    EditView()
}
