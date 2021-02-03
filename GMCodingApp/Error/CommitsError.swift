//
//  CommitsError.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation

public enum CommitsError: Error, Equatable {
    case noResponse
    case noData
    case decoding
    case unknown
    
    public static func == (lhs: CommitsError, rhs: CommitsError) -> Bool {
        switch (lhs, rhs) {
        case (.noResponse, .noResponse),
             (.noData, .noData),
             (.unknown, .unknown): return true
        default: return false
        }
    }
}
