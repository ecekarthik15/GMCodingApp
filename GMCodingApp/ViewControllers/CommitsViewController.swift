//
//  CommitsViewController.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import UIKit
import RxSwift

class CommitsViewController: BaseViewController<CommitsView>, UITableViewDataSource, UITableViewDelegate {
    
    private let disposeBag = DisposeBag()
    private let gitCommitsViewModel: GitCommitsViewModelProtocol
    var commitsArray: [CommitsModel] = []
    
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
        bindView()
        commitsTableViewSetup()
    }
    
    func bindView() {
        gitCommitsViewModel.getCommits().do(onNext: { [weak self] commits in
            guard let self = self else { return }
            self.commitsArray = commits
        })
        .observe(on: MainScheduler.instance)
        .subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.title = "Commits(\(self.commitsArray.count))"
            self.rootView.commitsTableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    private func commitsTableViewSetup() {
        rootView.commitsTableView.delegate = self
        rootView.commitsTableView.dataSource = self
        rootView.commitsTableView.register(CommitsCell.self, forCellReuseIdentifier: "CommitCell")
    }
}

extension CommitsViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commitsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commit = commitsArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommitCell", for: indexPath) as! CommitsCell
        cell.configureData(commit: commit)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let commitsModel = commitsArray[indexPath.row]
        let vc = CommitsDetailsViewController(commitsModel: commitsModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
