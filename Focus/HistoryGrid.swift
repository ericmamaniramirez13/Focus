//
//  HistoryGrid.swift
//  Focus
//
//  Created by Eric Jose Antonio Mamani Ramirez on 8/20/25.
//


import SwiftUI

struct HistoryGrid: View {
    let completed: Int

    let columns = Array(repeating: GridItem(.fixed(15), spacing: 4), count: 8)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 4) {
            ForEach(0..<30, id: \.self) { day in
                Rectangle()
                    .fill(day < completed ? Color.green : Color.gray.opacity(0.3))
                    .frame(width: 15, height: 15)
                    .cornerRadius(3)
                    .transition(.scale)
            }
        }
    }
}
#Preview {
    ContentView()
}
