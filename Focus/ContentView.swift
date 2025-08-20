import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var leetcodeDone = false
    @State private var tangoDone = false
    @State private var linkedinDone = false
    @State private var gymDone = false
    
    let totalTasks = 2
    var completedTasks: Int {
        [leetcodeDone, gymDone].filter { $0 }.count
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                TextField("Enter Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Text("Hello, \(name.isEmpty ? "world" : name)!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                TaskCard(title: "LeetCode (5/day)", isDone: $leetcodeDone, color: .black)
                TaskCard(title: "Gym Workout", isDone: $gymDone, color: .red)
                
                ProgressView(value: Double(completedTasks), total: Double(totalTasks))
                    .accentColor(.green)
                    .padding()
                    .animation(.easeInOut, value: completedTasks)
                
                // Navigation buttons
                HStack {
                    NavigationLink(destination: GymDetailView()) {
                        Text("Gym Details")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: LeetCodeDetailView()) {
                        Text("LeetCode Details")
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
            .navigationTitle("Focus App")
        }
    }
}

// Keep your existing TaskCard struct unchanged
struct TaskCard: View {
    let title: String
    @Binding var isDone: Bool
    let color: Color

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
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

#Preview {
    ContentView()
}
