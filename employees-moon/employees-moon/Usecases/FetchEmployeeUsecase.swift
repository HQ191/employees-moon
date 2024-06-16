struct FetchEmployeeUsecase {
    let networkService: NetworkService

    func invoke() async throws -> [EmployeeModel] {
        let employees: [EmployeeResponseModel] = await [
            try networkService.call(endpoint: .tallinnEmployees),
            try networkService.call(endpoint: .tartuEmployees)
        ]
        
        return employees.flatMap { $0.employees }
    }
}
