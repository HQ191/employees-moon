import SwiftUI

protocol Coordinator: ObservableObject {
    associatedtype ScreenView: View
    associatedtype CoordinatorView: View
    associatedtype Route: Equatable
    func makeView() -> CoordinatorView
    func makeScreenView() -> ScreenView
    func route(_ route: Route)
}
