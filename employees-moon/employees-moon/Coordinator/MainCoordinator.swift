import SwiftUI

enum MainRoute: Equatable {
    case detailView
}

protocol MainCoordinator: Coordinator {
}

class MainCoordinatorImpl: MainCoordinator {
    func makeView() -> some View {
        let coordinatorView = MainCoordinatorView(coordinator: self)
        return coordinatorView
    }
    
    func makeScreenView() -> some View {
        let viewModel = MainViewModelImpl(coordinator: self)
        return MainView(viewModel: viewModel)
    }
    
    func route(_ route: MainRoute) {
        
    }
}
