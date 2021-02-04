//
//  FakeGitCommitsViewModel.swift
//  GMCodingAppTests
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import RxSwift
import XCTest

@testable import GMCodingApp

class FakeGitCommitsViewModel:  GitCommitsViewModelProtocol {
    
    let getCommitsSubject = PublishSubject<[CommitsModel]>()
    func getCommits() -> Observable<[CommitsModel]> {
        return getCommitsSubject.asObservable()
    }
}
