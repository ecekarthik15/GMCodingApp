//
//  GMCodingAppUITests.swift
//  GMCodingAppUITests
//
//  Created by Karthik Kannan on 2/2/21.
//

import XCTest

class GMCodingAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDealsView() {
        App.shared.sendCollection(fileNames: ["CommitsCollection"], launchState: .install)
        _ = waitForElementToAppear(CommitsAccessIdentifiers.commitsFirstCell!)
        
        _ = waitForElementToAppear(CommitsAccessIdentifiers.commitsShaLabel)
        
        _ = waitForElementToAppear(CommitsAccessIdentifiers.commitsMessageLabel)
        
        _ = waitForElementToAppear(CommitsAccessIdentifiers.commitsAuthorLabel)
        
        CommitsAccessIdentifiers.commitsFirstCell!.tap()
        
        _ = waitForElementToAppear(CommitsAccessIdentifiers.commitsDetailShaLabel)
        
        _ = waitForElementToAppear(CommitsAccessIdentifiers.commitsDetailMessageLabel)
        
        _ = waitForElementToAppear(CommitsAccessIdentifiers.commitsDetailNameLabel)
        
        _ = waitForElementToAppear(CommitsAccessIdentifiers.commitsDetailDateLabel)
        
    }
    
    func waitForElementToAppear(_ element: XCUIElement, timeout: TimeInterval = 5) -> Bool {
        let predicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: predicate,
                                                    object: element)
        
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
        return result == .completed
    }
}
