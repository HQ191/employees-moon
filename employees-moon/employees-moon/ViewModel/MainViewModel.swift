import SwiftUI

enum MainViewEvent: Equatable {
    case onEmployeeSelected
}

protocol MainViewModel: ViewModel {
    var state: MainViewState { get }
    func event(_ event: MainViewEvent)
}


class MainViewModelImpl: MainViewModel {
    @ObservedObject var state: MainViewState = .init()
    let coordinator: MainCoordinatorImpl
    
    init(coordinator: MainCoordinatorImpl) {
        self.coordinator = coordinator
    }

    func event(_ event: MainViewEvent) {
        
    }
}
