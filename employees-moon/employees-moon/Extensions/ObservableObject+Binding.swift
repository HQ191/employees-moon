import SwiftUI

extension ObservableObject {
    public func binding<Value>(for keyPath: ReferenceWritableKeyPath<Self, Value>) -> Binding<Value> {
        return Binding(get: {
            self[keyPath: keyPath]
        }, set: { newValue in
            self[keyPath: keyPath] = newValue
        })
    }
}
