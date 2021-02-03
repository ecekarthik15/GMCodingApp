//
//  Result+Value.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation

extension Result {
    var value: Success? {
        switch self {
        case .success(let value): return value
        case .failure: return nil
        }
    }
    
    public var error: Failure? {
        switch self {
        case .success: return nil
        case .failure(let error): return error
        }
    }
}
