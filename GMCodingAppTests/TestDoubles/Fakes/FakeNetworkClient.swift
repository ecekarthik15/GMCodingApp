//
//  FakeNetworkClient.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation

@testable import GMCodingApp

class FakeNetworkClient: NetworkClientele {
    
    var response: URLReponseProtocol?
    var data: Data?
    var error: Error?
    
    func makeRequest(endPoint: Endpoint, completion: @escaping NetworkCompletionHandler) {
        completion(response, data, error)
    }
    
    func getResponse<T>(response: URLReponseProtocol?, data: Data?, error: Error?) -> Result<T, CommitsError> where T : Decodable, T : Encodable {
        
        guard let data = data else { return .failure(.noData) }
        let model = try! JSONDecoder().decode(T.self, from: data)
        return .success(model)
    }
}
