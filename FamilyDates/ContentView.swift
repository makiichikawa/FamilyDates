//
//  ContentView.swift
//  FamilyDates
//
//  Created by 市川真希 on 2024/05/20.
//

import SwiftUI

struct ContentView: View {
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
                HStack {
                    Text("自分").frame(width: 100, alignment: .leading)
                    Spacer()
                    Text("36").frame(width: 50, alignment: .center)
                    Spacer()
                    Text("-").frame(width: 100, alignment: .leading)
                }
                HStack {
                    Text("母").frame(width: 100, alignment: .leading)
                    Spacer()
                    Text("59").frame(width: 50, alignment: .center)
                    Spacer()
                    Text("還暦祝い").frame(width: 100, alignment: .leading)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
