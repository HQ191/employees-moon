import SwiftUI

enum MainRoute: Equatable {
    case detailView(EmployeeModel)
}

protocol MainCoordinator: Coordinator {
    var isDetailViewPresented: Bool { get set }
    func makeDetailView() -> AnyView
}

class MainCoordinatorImpl: MainCoordinator {
    @Published var isDetailViewPresented = false
    
    private let networkService: NetworkService
    private var employeeDetail: EmployeeModel?
    
    lazy var screenView: some View = {
        let viewModel = MainViewModelImpl(
            coordinator: self,
            fetchEmployeeUsecase: .init(networkService: networkService)
        )
        return MainView(viewModel: viewModel)
    }()
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func makeView() -> some View {
        let coordinatorView = MainCoordinatorView(coordinator: self)
        return coordinatorView
    }
    
    func route(_ route: MainRoute) {
        switch route {
        case .detailView(let employee):
            employeeDetail = employee
            isDetailViewPresented = true
        }
    }
    
    func makeDetailView() -> AnyView {
        guard let employee = employeeDetail else {
            return AnyView(EmptyView())
        }
        return AnyView(EmployeeDetailView(
            isPresented: binding(for: \.isDetailViewPresented),
            employee: employee
        ))
    }
}
