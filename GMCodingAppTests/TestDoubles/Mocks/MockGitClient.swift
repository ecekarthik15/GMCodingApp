//
//  MockGitClient.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import RxSwift

@testable import GMCodingApp

class MockGitClient: GitClientele {
    
    var isGetGitCommitsCalled = false
    func getGitCommits() -> Observable<[Commits]> {
        isGetGitCommitsCalled = true
        return .empty()
    }
}
