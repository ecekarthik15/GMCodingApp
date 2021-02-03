//
//  GitCommitsViewModelProtocol.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import RxSwift

protocol GitCommitsViewModelProtocol {
    func getCommits() -> Observable<[CommitsModel]>
}
