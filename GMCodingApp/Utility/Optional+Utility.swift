//
//  Optional+Utility.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation

extension Optional {
    public var exists: Bool {
        return self != nil
    }
    
    public var notExists: Bool {
        return self == nil
    }
}
