//
//  TrackerView.swift
//  Focus
//
//  Created by Eric Jose Antonio Mamani Ramirez on 8/20/25.
//

import SwiftUI

struct TrackerView: View {
    let mode: String

    @State private var leetcodeDone = false
    @State private var tangoDone = false
    @State private var gymDone = false

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                TaskCard(title: "LeetCode (5/day)", isDone: $leetcodeDone, color: .blue)
                TaskCard(title: "Tango Puzzle", isDone: $tangoDone, color: .orange)
                TaskCard(title: "Gym Workout", isDone: $gymDone, color: .red)
            }
            .padding()

            Divider()

            HistoryGrid(completed: 40) // temp data
                .frame(height: 200)
        }
        .navigationTitle(mode)
    }
}
