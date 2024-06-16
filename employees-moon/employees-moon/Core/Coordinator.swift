import SwiftUI

protocol Coordinator: ObservableObject {
    associatedtype ScreenView: View
    associatedtype CoordinatorView: View
    associatedtype Route: Equatable
    
    var screenView: ScreenView { get }

    func makeView() -> CoordinatorView
    func route(_ route: Route)
}
