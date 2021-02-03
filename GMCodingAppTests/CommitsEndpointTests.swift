//
//  CommitsEndpointTests.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import XCTest
@testable import GMCodingApp

class CommitsEndpointTests: XCTestCase {
    
    
    func testGetGitCommits() {
        
        let endpoint = CommitsEndpoint.getCommits
        let expectedUrlString = "https://api.github.com/repos/ecekarthik15/GMCodingApp/commits"
        
        XCTAssertEqual(endpoint.urlString, expectedUrlString)
        XCTAssertNotNil(endpoint.requestUrl)
        XCTAssertNotNil(endpoint.urlRequest)

    }
    
    func testGitCommitsHeaders() {
        let endpoint = CommitsEndpoint.getCommits

        let expectedHeaders = ["Accept": "*/*",
                               "Cache-Control": "no-cache",
                               "Host": "api.github.com",
                               "Accept-Encoding": "gzip, deflate",
                               "Connection": "keep-alive"]
        
        XCTAssertEqual(endpoint.headers, expectedHeaders)

    }
    
    func testGitCommitsRequestBody() {
        let endpoint = CommitsEndpoint.getCommits
        XCTAssertNil(endpoint.body)
    }
    
    func testGitCommitsRequestHTTPMethod() {
        let endpoint = CommitsEndpoint.getCommits
        XCTAssertEqual(endpoint.method, .get)
    }
    
    func testGitCommitsRequestScheme() {
        let endpoint = CommitsEndpoint.getCommits
        XCTAssertEqual(endpoint.scheme, "https")
    }
    
    func testGitCommitsRequestHost() {
        let endpoint = CommitsEndpoint.getCommits
        XCTAssertEqual(endpoint.host, "api.github.com")
    }
    
    func testGitCommitsRequestPath() {
        let endpoint = CommitsEndpoint.getCommits
        XCTAssertEqual(endpoint.path, "/repos/ecekarthik15/GMCodingApp/commits")
    }
    
    func testGitCommitsRequestQuery() {
        let endpoint = CommitsEndpoint.getCommits
        XCTAssertNil(endpoint.query)
    }
}
