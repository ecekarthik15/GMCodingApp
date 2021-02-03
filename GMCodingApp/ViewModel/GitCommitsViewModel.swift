//
//  GitCommitsViewModel.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import RxSwift

class GitCommitsViewModel: GitCommitsViewModelProtocol {
    
    private let gitClient: GitClientele
    
    init(gitClient: GitClientele) {
        self.gitClient = gitClient
    }
    
    convenience init() {
        self.init(gitClient: GitClient())
    }
    
    func getCommits() -> Observable<CommitsResponse> {
        return gitClient.getGitCommits()
    }
}
