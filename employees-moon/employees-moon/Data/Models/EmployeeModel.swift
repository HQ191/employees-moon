struct EmployeeModel: Decodable, Identifiable, Equatable {
    struct Contact: Decodable, Equatable {
        let email: String
        let phone: String?
    }
    
    enum CodingKeys: String, CodingKey {
        case fname
        case lname
        case position
        case contactDetails = "contact_details"
        case projects
    }
    
    var id: String { fname + lname }
    let fname: String
    let lname: String
    let position: String
    let contactDetails: Contact
    let projects: [String]?
}

