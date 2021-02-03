//
//  CommitsEndpoint.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation

enum CommitsEndpoint: Endpoint {
    
    case getCommits
    
    var headers: [String : String]? {
        switch self {
        case .getCommits:
            return ["Accept": "*/*",
                    "Cache-Control": "no-cache",
                    "Host": "api.github.com",
                    "Accept-Encoding": "gzip, deflate",
                    "Connection": "keep-alive"]
        }
    }
    
    var scheme: String {
        switch self {
        case .getCommits:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getCommits:
            return "api.github.com"
        }
    }
    
    var path: String {
        switch self {
        case .getCommits:
            return "/repos/ecekarthik15/GMCodingApp/commits"
        }
    }
    
    var method: httpmethod {
        switch self {
        case .getCommits:
            return .get
        }
    }
    
    var query: [URLQueryItem]? {
        switch self {
        case .getCommits:
            return nil
        }
    }
    
    var body: Data? {
        switch self {
        case .getCommits:
            return nil
        }
    }
}
