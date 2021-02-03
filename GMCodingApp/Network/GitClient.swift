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
        return Observable.create { [weak self] observer in
            let disposable = Disposables.create()
            guard let strongSelf = self else {
                observer.onCompleted()
                return disposable
            }
            let endpoint = CommitsEndpoint.getCommits
            strongSelf.networkClient.makeRequest(endPoint: endpoint, completion: { (response, data, error) in
                guard let strongSelf = self else { return }
                let result: Result<CommitsResponse, CommitsError> = strongSelf.networkClient.getResponse(response: response, data: data, error: error)
                switch result {
                case .success(let model):
                    observer.onNext(model)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            })
            
            return disposable
        }
    }
}
