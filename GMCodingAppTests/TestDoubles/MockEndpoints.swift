//
//  MockEndpoints.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
@testable import GMCodingApp

class MockEndpoints: Endpoint {
    var headers: [String : String]? = [:]
    
    var scheme: String = "https"
    
    var host: String = "."
    
    var path: String = ""
    
    var method: httpmethod = .get
    
    var query: [URLQueryItem]? = nil
    
    var body: Data? = nil
    
    
}
