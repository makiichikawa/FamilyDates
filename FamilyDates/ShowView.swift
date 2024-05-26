//
//  ShowView.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/25.
//

import SwiftUI

struct ShowView: View {
    let human: Person
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                ScrollView {
                    CardView()
                    Spacer()
                }
            }.background(Color(UIColor.systemGray6))
        }
    }
}

struct CardView: View {
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
            
            Text("自分")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("年齢")
                    .font(.headline)
                Text("・36歳と6ヶ月")
                    .padding(.leading, 8)
                
                Text("誕生日")
                    .font(.headline)
                Text("・1987/10/29 (S62.10.20)")
                    .padding(.leading, 8)
                
                Text("・もうすぐで還暦を迎えます")
                
                Text("祝いメモ")
                    .font(.headline)
                Text("・小学校入学：5千円")
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
                    // Edit action
                }) {
                    Text("編集")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
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
}

#Preview {
    ShowView(human: Person(name: "ichikawa", age: 37, event: "還暦"))
}
