//
//  CommitsDetailViewcontrollerSnapShotTests.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import XCTest
import SnapshotTesting

@testable import GMCodingApp

class CommitsDetailViewcontrollerSnapShotTests: XCTestCase {
    var subject: CommitsDetailsViewController!
    var fakeCommitsModel: CommitsModel!
    override func setUp() {
        let author = CommitAuthor(name: "Test", email: "email", date: "date")
        fakeCommitsModel = CommitsModel(author: author, hash: "hash", message: "message")
        subject = CommitsDetailsViewController(commitsModel: fakeCommitsModel)
    }

    func testDealsViewController() {
        let nc = UINavigationController(rootViewController: subject)
        nc.pushViewController(subject, animated: true)
        subject.view.frame = UIScreen.main.bounds
        subject.view.layoutIfNeeded()
        assertSnapshot(matching: subject, as: .image)
    }
    
    override func tearDown() {
        fakeCommitsModel = nil
        subject = nil
    }
}
