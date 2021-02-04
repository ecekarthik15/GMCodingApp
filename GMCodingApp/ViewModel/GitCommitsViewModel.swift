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
    
    func getCommits() -> Observable<[CommitsModel]> {
        return gitClient.getGitCommits()
            .map { commitsResponse ->  [CommitsModel] in
                
                return commitsResponse
                    .map { commits -> CommitsModel in
                        return CommitsModel(author: commits.commit?.author?.name ?? "",
                                            hash: commits.sha ?? "",
                                            message: commits.commit?.message ?? "")
                    }
            }
    }
}
