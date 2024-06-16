import Foundation

protocol NetworkService {
    func call<T:Decodable>(endpoint: Endpoint) async throws -> T
}

class NetworkServiceImpl: NetworkService {
    func call<T:Decodable>(endpoint: Endpoint) async throws -> T {
        guard let request = endpoint.request else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(T.self, from: data)
    }
}

extension Endpoint {
    var request: URLRequest? {
        guard let url = URL(string: path) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
