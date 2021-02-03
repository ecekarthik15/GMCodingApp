//
//  NetworkClientTests.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import XCTest
@testable import GMCodingApp

class NetworkClientTests: XCTestCase {
    
    func testGetResponse_with_nilResponse() {
        
        // Dependencies
        let mockSession = MockURLSession()
        let subject = NetworkClient(session: mockSession)
        
        // GetResponse Invoked
        let result: Result<MockGenericCodableResponse, CommitsError> = subject.getResponse(response: nil, data: nil, error: nil)
        
        // Error should equal to noResponse
        XCTAssertEqual(result.error, CommitsError.noResponse)
    }
    
    func testGetResponse_with_nilData() {
        
        // Dependencies
        let mockSession = MockURLSession()
        let fakeUrlResponse = FakeURLResponse()
        fakeUrlResponse.status = 200
        let subject = NetworkClient(session: mockSession)
        
        // GetResponse Invoked
        let result: Result<MockGenericCodableResponse, CommitsError> = subject.getResponse(response: fakeUrlResponse, data: nil, error: nil)
        
        // Error should equal to noData
        XCTAssertEqual(result.error, CommitsError.noData)
    }
    
    func testGetResponse_with_InvalidStatusCode() {
        
        // Dependencies
        let mockSession = MockURLSession()
        let fakeUrlResponse = FakeURLResponse()
        fakeUrlResponse.status = 500
        let subject = NetworkClient(session: mockSession)
        
        // GetResponse Invoked
        let result: Result<MockGenericCodableResponse, CommitsError> = subject.getResponse(response: fakeUrlResponse, data: nil, error: nil)
        
        // Error should equal to unknown
        XCTAssertEqual(result.error, CommitsError.unknown)
    }
    
    //TODO: Need to implement after defining the Data model
    func testGetResponseWith_DecodingError() {
        // Dependencies
        let mockSession = MockURLSession()
        let fakeUrlResponse = FakeURLResponse()
        fakeUrlResponse.status = 200
        let subject = NetworkClient(session: mockSession)
        
        // GetResponse Invoked
        let result: Result<MockGenericCodableResponse, CommitsError> = subject.getResponse(response: fakeUrlResponse, data: nil, error: nil)
        
        // Error should equal to unknown
    }
    
    func testMakeRequest() {
        
        // Dependencies
        let mockSession = MockURLSession()
        
        let fakeUrlResponse = FakeURLResponse()
        fakeUrlResponse.status = 500
        
        let mockEndpoints = MockEndpoints()
        let subject = NetworkClient(session: mockSession)
        
        // makeRequest Invoked
        _ = subject.makeRequest(endPoint: mockEndpoints, completion: { (_, _, _) in
        })
        
        // Error should equal to unknown
        XCTAssertTrue(mockSession.isDataTaskCalled)
    }
}
