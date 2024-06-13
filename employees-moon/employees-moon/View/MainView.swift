import SwiftUI

struct MainView<VM: MainViewModel>: View {
    @ObservedObject var viewModel: VM
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
