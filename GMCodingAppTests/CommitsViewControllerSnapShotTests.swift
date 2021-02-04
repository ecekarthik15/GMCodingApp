//
//  CommitsViewControllerSnapShotTests.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import XCTest
import SnapshotTesting

@testable import GMCodingApp

class CommitsViewControllerSnapShotTests: XCTestCase {
    var subject: CommitsViewController!
    var fakeGitCommitsViewModel: FakeGitCommitsViewModel!
    override func setUp() {
        fakeGitCommitsViewModel = FakeGitCommitsViewModel()
        subject = CommitsViewController(gitCommitsViewModel: fakeGitCommitsViewModel)
    }

    func testDealsViewController() {
        let commit = CommitsModel(author: "Test", hash: "123", message: "test")
        let commit2 = CommitsModel(author: "Test2", hash: "1234", message: "test2")
        
        let nc = UINavigationController(rootViewController: subject)
        nc.pushViewController(subject, animated: true)
        subject.view.frame = UIScreen.main.bounds
        subject.view.layoutIfNeeded()
        fakeGitCommitsViewModel.getCommitsSubject.onNext([commit, commit2])
        assertSnapshot(matching: subject, as: .image)
    }
    
    override func tearDown() {
        fakeGitCommitsViewModel = nil
        subject = nil
    }
}
