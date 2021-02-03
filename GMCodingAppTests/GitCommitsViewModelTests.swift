//
//  GitCommitsViewModelTests.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import XCTest

@testable import GMCodingApp

class GitCommitsViewModelTests: XCTestCase {
    
    func testInitilization() {
        
        //Dependencies
        let mockGitClient = MockGitClient()
        let subject = GitCommitsViewModel(gitClient: mockGitClient)
        
        // Should not be nil
        XCTAssertNotNil(subject)
    }
}
