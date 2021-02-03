//
//  BaseViewController.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import UIKit

class BaseViewController<T: UIView>: UIViewController {
    
    lazy var rootView: T = T()
    
    override func loadView() {
        view = rootView
    }
}
