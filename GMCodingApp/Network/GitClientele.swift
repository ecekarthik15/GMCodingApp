//
//  GitClientele.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import RxSwift

protocol GitClientele {
    func getGitCommits() -> Observable<[Commits]>
}
