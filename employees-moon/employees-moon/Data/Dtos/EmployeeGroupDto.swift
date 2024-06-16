struct EmployeeGroupDto: Identifiable, Equatable {
    var id: String { name }
    let name: String
    let employees: [EmployeeModel]
}
