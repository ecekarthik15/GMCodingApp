//
//  NetworkClientele.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation

protocol NetworkClientele {
    func makeRequest(endPoint: Endpoint, completion: @escaping ((Data?, URLResponse?, Error?) -> Void))
    func getResponse<T: Codable>(response: URLResponse?, data: Data?, error: Error?)
        -> Result<T, Error>
}
