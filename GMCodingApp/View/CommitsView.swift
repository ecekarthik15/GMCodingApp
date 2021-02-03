//
//  CommitsView.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import UIKit
import SnapKit

class CommitsView: UIView {
    lazy var commitsTableView: UITableView = {
        let tableView = UITableView()
        tableView.isUserInteractionEnabled = true
        tableView.accessibilityIdentifier = "commits.tableview"
        tableView.separatorStyle = .none
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        buildView()
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildView() {
        addSubview(commitsTableView)
    }
    
    func configureView() {
        commitsTableView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.bottom.trailing.equalToSuperview().inset(8)
        }
    }
}
