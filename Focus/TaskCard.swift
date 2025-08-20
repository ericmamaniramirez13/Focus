//
//  TaskCard.swift
//  Focus
//
//  Created by Eric Jose Antonio Mamani Ramirez on 8/20/25.
//


import SwiftUI

struct TaskCard: View {
    let title: String
    @Binding var isDone: Bool
    let color: Color
    private var imageName: String? {
        if title == "LeetCode (5/day)" {
            return "brain.head.profile"
        }
        else if title == "Gym Workout" {
            return "dumbbell.fill"
        }
        else if title == "Tango Puzzle" {
            return "gamecontroller.fill"
        }
        // You can add more conditions here for other titles
        // else if title == "Read a book" {
        //     return "book.fill"
        // }

        // Return nil if no specific image should be shown for this title
        return nil
    }

    var body: some View {
        HStack {
            Text(title).font(.headline)
            Spacer()
            if let name = imageName {
                Image(systemName: name)
            }
            Image(systemName: isDone ? "checkmark.circle.fill" : "circle")
                .foregroundColor(color)
                .onTapGesture {
                    withAnimation(.spring()) {
                        isDone.toggle()
                    }
                }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
        .shadow(radius: 3)
    }
}
