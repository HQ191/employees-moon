import SwiftUI

struct MainCoordinatorView<Coordinator: MainCoordinator>: View {
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        coordinator.makeScreenView()
    }
}
