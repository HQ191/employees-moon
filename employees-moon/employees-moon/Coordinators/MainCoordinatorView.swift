import SwiftUI

struct MainCoordinatorView<Coordinator: MainCoordinator>: View {
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        coordinator.screenView
            .sheet(isPresented: $coordinator.isDetailViewPresented) {
                coordinator.makeDetailView()
            }
    }
}
