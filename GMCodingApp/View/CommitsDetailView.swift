//
//  commitsDetailView.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import UIKit
import SnapKit

class CommitsDetailView: UIView {
    
    static let layoutTopMargin = 20

    static let layoutLeftRightMargin = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        buildView()
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        return scrollview
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 10
        stackview.alignment = .leading
        stackview.distribution = .fill
        return stackview
    }()
    
    lazy var shaLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "commits.detail.sha"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = label.font.withSize(18)
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "commits.detail.message"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = label.font.withSize(18)
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "commits.detail.name"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = label.font.withSize(18)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "commits.detail.date"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = label.font.withSize(18)
        return label
    }()
    
    func buildView() {
        addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        [shaLabel, messageLabel, nameLabel, dateLabel].forEach {
            contentStackView.addArrangedSubview($0)
        }
    }
    
    func configureView() {
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        contentStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CommitsDetailView.layoutTopMargin)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        [shaLabel, messageLabel, nameLabel, dateLabel].forEach {
            $0.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(CommitsDetailView.layoutLeftRightMargin)
                make.trailing.equalToSuperview().inset(CommitsDetailView.layoutLeftRightMargin)
            }
        }
    }
    
    func configureData(commit: CommitsModel) {
        shaLabel.text = commit.hash ?? "NA"
        messageLabel.text = commit.message ?? "NA"
        nameLabel.text = commit.author?.name ?? "NA"
        dateLabel.text = commit.author?.date ?? "NA"
    }
}
