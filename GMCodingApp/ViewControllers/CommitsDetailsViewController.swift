//
//  CommitsDetailsViewController.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import UIKit
import RxSwift

class CommitsDetailsViewController: BaseViewController<CommitsDetailView> {
    private let commitsModel: CommitsModel

    init(commitsModel: CommitsModel) {
        self.commitsModel = commitsModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        bindView()
    }
    
    func bindView() {
        rootView.configureData(commit: commitsModel)
    }
}
