import SwiftUI
import Combine

enum MainViewEvent: Equatable {
    case onEmployeeSelected(EmployeeModel)
}

protocol MainViewModel: ViewModel {
    var employeeGroups: [EmployeeGroupDto] { get set }
    var searchText: String { get set }
    
    func event(_ event: MainViewEvent)
}

class MainViewModelImpl: MainViewModel {
    @Published var employeeGroups: [EmployeeGroupDto] = []
    @Published var searchText: String = ""
    let coordinator: MainCoordinatorImpl

    private let fetchEmployeeUsecase: FetchEmployeeUsecase
    private var employees: [EmployeeModel] = []
    private var subscriptions: Set<AnyCancellable> = []
    
    init(coordinator: MainCoordinatorImpl, fetchEmployeeUsecase: FetchEmployeeUsecase) {
        self.coordinator = coordinator
        self.fetchEmployeeUsecase = fetchEmployeeUsecase
        
        initilise()
    }
    
    func event(_ event: MainViewEvent) {
        switch event {
        case .onEmployeeSelected(let employee):
            coordinator.route(.detailView(employee))
        }
    }
}

private extension MainViewModelImpl {
    private func initilise() {
        observeSeachText()
        Task { await fetchEmployees() }
    }
    
    func observeSeachText() {
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [unowned self] searchText in
                employeeGroups = employees.filterEmployees(searchString: searchText)
                    .sortedGroups
            }
            .store(in: &subscriptions)
    }
    
    @MainActor func fetchEmployees() async {
        guard let employees = try? await fetchEmployeeUsecase.invoke() else { return }
        self.employees = employees
        employeeGroups = employees.sortedGroups
    }
}

private extension [EmployeeModel] {
    var sortedGroups: [EmployeeGroupDto] {
        let groups = Set(map(\.position))
            .sorted()
            .map { position in
                let employees = filter { $0.position == position }
                    .sorted { $0.fname < $1.fname }
                return EmployeeGroupDto(name: position, employees: employees)
            }
        
        return groups
    }
    
    func filterEmployees(searchString: String) -> [EmployeeModel] {
        guard !searchString.isEmpty else {
            return self
        }
        
        let lowercasedSearchString = searchString.lowercased()
        
        return filter { employee in
            let matchesName = employee.fname.lowercased().contains(lowercasedSearchString)
            || employee.lname.lowercased().contains(lowercasedSearchString)
            
            let matchesPosition = employee.position.lowercased().contains(lowercasedSearchString)
            
            let matchesProjects = employee.projects?.contains(where: { $0.lowercased().contains(lowercasedSearchString) }) ?? false
            
            return matchesName || matchesPosition || matchesProjects
        }
    }
}
