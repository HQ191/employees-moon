import SwiftUI

struct MainViewState: Equatable {
    let employeeGroups: [EmployeeGroupDto]
    
    func copyWith(employeeGroups: [EmployeeGroupDto]? = nil) -> MainViewState {
        MainViewState(employeeGroups: employeeGroups ?? self.employeeGroups)
    }
}
