//
//  FakeGitClient.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import RxSwift

@testable import GMCodingApp

class FakeGitClient: GitClientele {
    
    let getGitCommitsSubject = PublishSubject<CommitsResponse>()
    
    func getGitCommits() -> Observable<[Commits]> {
        return getGitCommitsSubject.asObservable()
    }
}
