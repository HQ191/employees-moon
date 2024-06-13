import SwiftUI

@main
struct EmployeesApp: App {
    var body: some Scene {
        WindowGroup {
            MainCoordinatorImpl().makeView()
        }
    }
}
