//
//  ShowView.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/25.
//

import SwiftUI

struct ShowView: View {
    var human: Person
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                ScrollView {
                    CardView(human: human)
                    Spacer()
                }
            }.background(Color(UIColor.systemGray6))
        }
    }
}

struct CardView: View {
    @State var human: Person
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
            
            Text(human.name)
                .font(.title)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("誕生日")
                    .font(.headline)
                Text(dateFormatter.string(from: human.birthDay))
                    .padding(.leading, 8)
                Text("もうすぐ")
                    .font(.headline)
                Text(human.event)
                    .padding(.leading, 8)
                Text("祝いメモ")
                    .font(.headline)
                Text("小学校入学：5千円")
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
                    EditView(human: $human)
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
    ShowView(human: Person(name: "ichikawa", birthDay: Date(), event: "還暦"))
}
