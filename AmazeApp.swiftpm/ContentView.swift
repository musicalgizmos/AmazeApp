import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Landing Page")
                    .font(.title)
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Spacer()
                NavigationLink(destination: FirstDetailScreen()) {
                    Text("Go to FirstDetailScreen")
                        .font(.title2)
                        .padding()
                        .border(Color.purple, width: 5)
                }
                NavigationLink(destination: SecondDetailScreen()) {
                    Text("Go to SecondDetailScreen")
                        .font(.title2)
                        .padding()
                        .border(Color.purple, width: 5)
                }
                Spacer()
            }
        }
    }
}
