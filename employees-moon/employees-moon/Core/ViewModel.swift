import Combine
import SwiftUI

protocol ViewModel: ObservableObject {
    associatedtype State: Equatable
    associatedtype Coord: Coordinator
    associatedtype Event: Equatable

    var state: State { get }
    var coordinator: Coord { get }
    
    func event(_ event: Event)
}

extension ViewModel {
    func route(_ route: Coord.Route) {
        coordinator.route(route)
    }
}
