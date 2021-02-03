//
//  GitClient.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import RxSwift

class GitClient: GitClientele {
    
    let networkClient: NetworkClientele

    init(networkClient: NetworkClientele) {
        self.networkClient = networkClient
    }
    
    convenience init() {
        self.init(networkClient: NetworkClient())
    }
    
    func getGitCommits() -> Observable<[Commits]> {
        return .empty()
    }
}
