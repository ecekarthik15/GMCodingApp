//
//  NetworkClient.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation

class NetworkClient: NetworkClientele {
    
    private let session: URLSessionProtocol
    
    required init(session: URLSessionProtocol) {
        self.session = session
    }
    
    convenience init() {
        self.init(session: URLSession(configuration: URLSessionConfiguration.default))
    }
    
    func makeRequest(endPoint: Endpoint, completion: @escaping NetworkCompletionHandler) {
        guard let request = endPoint.urlRequest else { return }
        session.dataTask(with: request) { data, response, error in
            print("error: \(error.debugDescription)")
            completion(response, data, error)
        }.resume()
    }
    
    func getResponse<T>(response: URLReponseProtocol?, data: Data?, error: Error?) -> Result<T, CommitsError> where T : Decodable, T : Encodable {
        
        guard let httpResponse = response else { return .failure(.noResponse)}
        switch httpResponse.status {
        case 200..<300:
            guard let data = data else { return .failure(.noData) }
            return decode(data: data)
        default:
            return .failure(.unknown)
        }
    }
    
    func decode<T: Codable>(data: Data) -> Result<T, CommitsError> {
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return .success(model)
        } catch {
            print("parsing error")
            return .failure(.decoding)
        }
    }
}
