import SwiftUI

enum MainRoute: Equatable {
    case detailView
}

protocol MainCoordinator: Coordinator {
}

class MainCoordinatorImpl: MainCoordinator {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func makeView() -> some View {
        let coordinatorView = MainCoordinatorView(coordinator: self)
        return coordinatorView
    }
    
    func makeScreenView() -> some View {
        let viewModel = MainViewModelImpl(
            coordinator: self,
            fetchEmployeeUsecase: .init(networkService: networkService)
        )
        return MainView(viewModel: viewModel)
    }
    
    func route(_ route: MainRoute) {
        
    }
}
