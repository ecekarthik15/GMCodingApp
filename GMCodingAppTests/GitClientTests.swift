//
//  GitClientTests.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import XCTest

@testable import GMCodingApp

class GitClientTests: XCTestCase {
    
    func testIntilization() {
        
        // dependencies
        let mockNetworkClient = MockNetworkClient()
        let subject = GitClient(networkClient: mockNetworkClient)
        
        // Should not be nil
        XCTAssertNotNil(subject)
    }
}
