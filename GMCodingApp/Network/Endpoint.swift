//
//  Endpoint.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation

protocol Endpoint {
    var headers: [String:String]? { get }
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: httpmethod { get }
    var query: [URLQueryItem]? { get }
    var body: Data? { get }
}

enum httpmethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

extension Endpoint {
    var requestUrl: URL? {
        var urlComponenets = URLComponents()
        urlComponenets.path = path
        urlComponenets.scheme = scheme
        urlComponenets.host = host
        urlComponenets.queryItems = query
        
        return urlComponenets.url
    }
    
    var urlRequest: URLRequest? {
        guard let url = requestUrl else { return nil }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        if let body = body {
            request.httpBody = body
        }
        request.httpMethod = method.rawValue
        return request
    }
}
