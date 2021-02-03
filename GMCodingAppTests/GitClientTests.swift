//
//  GitClientTests.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import RxSwift
import XCTest

@testable import GMCodingApp

class GitClientTests: XCTestCase {
    
    var disposeBag: DisposeBag!
    
    override func setUp() {
        disposeBag = DisposeBag()
    }
    
    func testIntilization() {
        
        // dependencies
        let mockNetworkClient = MockNetworkClient()
        let subject = GitClient(networkClient: mockNetworkClient)
        
        // Should not be nil
        XCTAssertNotNil(subject)
    }
    
    func testGetGitCommits() {
        // dependencies
        let mockNetworkClient = MockNetworkClient()
        let subject = GitClient(networkClient: mockNetworkClient)
        
        // When GetGitCommits called
        subject.getGitCommits().subscribe().disposed(by: disposeBag)
        
        // Should be true
        XCTAssertTrue(mockNetworkClient.isMakeRequestCalled)
        
        XCTAssertTrue(mockNetworkClient.isGetResponseCalled)
    }
    
    func testGetGitCommitsWithValidData() {
        // dependencies
        let fakeNetworkClient = FakeNetworkClient()
        
        let fakeResponse = FakeURLResponse()
        fakeResponse.status = 200
        fakeNetworkClient.response = fakeResponse
        fakeNetworkClient.data = GitCommitsJson.commitsResponse.data(using: .utf8)!
        
        let subject = GitClient(networkClient: fakeNetworkClient)
        
        // When GetGitCommits called
        var receivedResult: [Commits]?
        subject.getGitCommits().subscribe(onNext: { result in
        receivedResult = result
        }).disposed(by: disposeBag)
        
        XCTAssertNotNil(receivedResult)
    }
    
    func testGetGitCommitsWithFailiure() {
        // dependencies
        let fakeNetworkClient = FakeNetworkClient()
        
        let fakeResponse = FakeURLResponse()
        fakeResponse.status = 400
        fakeNetworkClient.response = fakeResponse
        fakeNetworkClient.data = nil
        
        let subject = GitClient(networkClient: fakeNetworkClient)
        
        // When GetGitCommits called
        var receivedError: CommitsError?
        subject.getGitCommits().subscribe(onError: { error in
        receivedError = error as? CommitsError
        }).disposed(by: disposeBag)
        
        XCTAssertNotNil(receivedError)
    }
    
    override func tearDown() {
        disposeBag = nil
    }
}
