//
//  ShowView.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/25.
//

import SwiftUI
import SwiftData

struct ShowView: View {
    var person: Person
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                ScrollView {
                    CardView(person: person)
                    Spacer()
                }
            }.background(Color(UIColor.systemGray6))
        }
    }
}

struct CardView: View {
    @Bindable var person: Person
    @State var isShowEditView = false
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
                Image(systemName: "triangle.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.top)
            
            Text(person.name)
                .font(.title)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("誕生日")
                    .font(.headline)
                Text(dateFormatter.string(from: person.birthDay))
                    .padding(.leading, 8)
                Text("次の予定")
                    .font(.headline)
                Text("小学校入学：5千円")
                    .padding(.leading, 8)
                Text("メモ")
                    .font(.headline)
                Text(person.memo)
                    .padding(.leading, 8)
            }
            
            HStack {
                Button(action: {
                    // Deletion action
                }) {
                    Text("削除")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    isShowEditView = true
                }) {
                    Text("編集")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }.sheet(isPresented: $isShowEditView){
                    EditView(person: person, insert: false, isShowingEditView: $isShowEditView)
                }
            }
            .padding(.top)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 4)
        .padding()
        .padding()
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

#Preview {
    ShowView(person: Person(name: "ichikawa", birthDay: Date(), memo: "還暦"))
}
