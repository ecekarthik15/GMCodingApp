//
//  GitCommitsViewModelTests.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import XCTest
import RxSwift

@testable import GMCodingApp

class GitCommitsViewModelTests: XCTestCase {
    var disposeBag: DisposeBag!
    
    override func setUp() {
        disposeBag = DisposeBag()
    }
    
    func testInitilization() {
        
        //Dependencies
        let mockGitClient = MockGitClient()
        let subject = GitCommitsViewModel(gitClient: mockGitClient)
        
        // Should not be nil
        XCTAssertNotNil(subject)
    }
    
    func testGetCommits() {
        // dependencies
        let mockGitClient = MockGitClient()
        
        let subject = GitCommitsViewModel(gitClient: mockGitClient)
        
        // When getCommits called
        subject.getCommits().subscribe().disposed(by: disposeBag)
        
        // should be true
        XCTAssertTrue(mockGitClient.isGetGitCommitsCalled)
    }
    
    func testGetGitCommitsWithValidData() {
        // dependencies
        let fakeGitClient = FakeGitClient()
        let data = GitCommitsJson.commitsResponse.data(using: .utf8)!
        let model = try? JSONDecoder().decode(CommitsResponse.self, from: data)
        let subject = GitCommitsViewModel(gitClient: fakeGitClient)
        
        // When GetGitCommits called
        var receivedResult: [Commits]?
        subject.getCommits().subscribe(onNext: { result in
        receivedResult = result
        }).disposed(by: disposeBag)
        
        fakeGitClient.getGitCommitsSubject.onNext(model!)
        
        //Should not be nil
        XCTAssertNotNil(receivedResult)
    }
    
    func testGetGitCommitsWithFailiure() {
        // dependencies
        let fakeGitClient = FakeGitClient()
        let subject = GitCommitsViewModel(gitClient: fakeGitClient)
                
        // When GetGitCommits called
        var receivedError: CommitsError?
        subject.getCommits().subscribe(onError: { error in
        receivedError = error as? CommitsError
        }).disposed(by: disposeBag)
        
        fakeGitClient.getGitCommitsSubject.onError(CommitsError.unknown)

        //Should not be nil
        XCTAssertNotNil(receivedError)
        XCTAssertEqual(receivedError, CommitsError.unknown)
    }
    
    override func tearDown() {
        disposeBag = nil
    }
}
