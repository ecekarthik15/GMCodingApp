//
//  MockURLSession.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
@testable import GMCodingApp

class MockURLSession: URLSessionProtocol {
    
    var isDataTaskCalled = false
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        isDataTaskCalled = true
        
        return URLSession.shared.dataTask(with: request)
    }
}
