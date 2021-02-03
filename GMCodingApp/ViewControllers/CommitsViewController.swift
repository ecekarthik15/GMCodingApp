//
//  CommitsViewController.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import RxSwift

class CommitsViewController: BaseViewController<CommitsView> {
    
    private let disposeBag = DisposeBag()
    private let gitCommitsViewModel: GitCommitsViewModelProtocol
    
    init(gitCommitsViewModel: GitCommitsViewModelProtocol) {
        self.gitCommitsViewModel = gitCommitsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Commits"
        
        gitCommitsViewModel.getCommits().subscribe().disposed(by: disposeBag)
    }
}
