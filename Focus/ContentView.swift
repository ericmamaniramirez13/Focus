import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink {
                    TrackerView(mode: "Software Engineer Candidate")
                } label: {
                    HStack {
                        Image(systemName: "laptopcomputer") // icon for mode
                            .font(.title)
                        Text("Software Engineer Candidate")
                            .font(.headline)
                            .padding(.leading, 5)
                    }
                    .padding()
                    //.frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.orange.opacity(0.2)))
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.yellow, lineWidth: 2))
                    .shadow(radius: 5)
                    .foregroundColor(.black)
                }

                NavigationLink("Gym Focus") {
                    TrackerView(mode: "Gym Focus")
                }
                .buttonStyle(.bordered)

                NavigationLink("Learn English Words") {
                    TrackerView(mode: "Learn English Words")
                }
                .buttonStyle(.bordered)
            }
            .navigationTitle("Choose Mode")
        }
    }
}

#Preview {
    ContentView()
}
