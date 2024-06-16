import SwiftUI

enum MainViewEvent: Equatable {
    case onEmployeeSelected(EmployeeModel)
}

protocol MainViewModel: ViewModel {
    var state: MainViewState { get }
    func event(_ event: MainViewEvent)
}

class MainViewModelImpl: MainViewModel {
    @Published var state: MainViewState = .init(employeeGroups: [])
    
    let coordinator: MainCoordinatorImpl
    private let fetchEmployeeUsecase: FetchEmployeeUsecase
    
    init(coordinator: MainCoordinatorImpl, fetchEmployeeUsecase: FetchEmployeeUsecase) {
        self.coordinator = coordinator
        self.fetchEmployeeUsecase = fetchEmployeeUsecase
        
        Task {
            await fetchEmployees()
        }
    }
    
    func event(_ event: MainViewEvent) {
        switch event {
        case .onEmployeeSelected(let employee):
            print(employee)
        }
    }
}

private extension MainViewModelImpl {
    @MainActor func fetchEmployees() async {
        guard let employees = try? await fetchEmployeeUsecase.invoke() else { return }
        
        let groups = Set(employees.map(\.position))
            .sorted()
            .map { position in
                let employees = employees.filter { $0.position == position }
                    .sorted { $0.fname < $1.fname }
                return EmployeeGroupDto(name: position, employees: employees)
            }
        
        state = state.copyWith(employeeGroups: groups)
    }
}
