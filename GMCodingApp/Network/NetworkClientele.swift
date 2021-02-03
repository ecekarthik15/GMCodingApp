//
//  NetworkClientele.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
typealias NetworkCompletionHandler = (URLReponseProtocol?, Data?, Error?) -> Void

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

protocol URLReponseProtocol {
    var status: Int { get }
}

protocol NetworkClientele {
    func makeRequest(endPoint: Endpoint, completion: @escaping NetworkCompletionHandler)
    func getResponse<T: Codable>(response: URLReponseProtocol?, data: Data?, error: Error?)
        -> Result<T, CommitsError>
}

extension URLResponse: URLReponseProtocol {
    var status: Int {
        return (self as? HTTPURLResponse)?.statusCode ?? 500
    }
}

extension URLSession: URLSessionProtocol { }
