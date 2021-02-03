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
    
    func getGitCommits() -> Observable<[Commits]> {
        return .empty()
    }
}
