//
//  CommitsCell.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import UIKit

class CommitsCell: UITableViewCell {
    
    lazy var cView: UIView = {
        let stackview = UIView()
        stackview.layer.cornerRadius = 2
        stackview.layer.borderWidth = 1
        stackview.clipsToBounds = true
        stackview.layer.borderColor = UIColor.black.cgColor
        return stackview
    }()
    
    lazy var vStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 2
        stackview.alignment = .leading
        stackview.distribution = .fill
        return stackview
    }()
    
    lazy var shaLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.accessibilityIdentifier = "commits.tableview.cell.sha"
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = label.font.withSize(10)
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.accessibilityIdentifier = "commits.tableview.cell.message"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.accessibilityIdentifier = "commits.tableview.cell.author"
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = label.font.withSize(12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        isUserInteractionEnabled = true
        accessibilityIdentifier = "commits.tableview.cell"
        buildView()
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildView() {
        
        backgroundColor = .clear
        addSubview(cView)
        cView.addSubview(vStackView)
        
        [shaLabel, messageLabel, authorLabel].forEach {
            vStackView.addArrangedSubview($0)
        }
    }
    
    func configureView() {
        cView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().inset(5)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().inset(5)
            
        }
        
        vStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
    
    func configureData(commit: CommitsModel) {
        shaLabel.text = commit.hash
        messageLabel.text = commit.message
        authorLabel.text = commit.author
    }
}
