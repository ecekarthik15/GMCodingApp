//
//  MockNetworkClient.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
@testable import GMCodingApp

class MockNetworkClient: NetworkClientele {
    
    var isMakeRequestCalled = false
    func makeRequest(endPoint: Endpoint, completion: @escaping NetworkCompletionHandler) {
        isMakeRequestCalled = true
        completion(nil, nil, nil)
    }
    
    var isGetResponseCalled = false
    func getResponse<T>(response: URLReponseProtocol?, data: Data?, error: Error?) -> Result<T, CommitsError> where T : Decodable, T : Encodable {
        isGetResponseCalled = true
        
        return .failure(.unknown)
    }
}

