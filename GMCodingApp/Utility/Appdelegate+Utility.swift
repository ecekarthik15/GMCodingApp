//
//  Appdelegate+Utility.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import UIKit

extension AppDelegate {
     func configureForUITesting() {
        UIView.setAnimationsEnabled(false)
        if ProcessInfo.processInfo.environment["UI-TEST-CLEAR-PERSISTENT-DATA"] == "1" {
            UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        }
        URLSessionConfiguration.mockingSwizzleDefaultSessionConfiguration()
        URLSession.mockSharedSession()
        let collections = ProcessInfo.processInfo.environment["collectionJSON"]
        print("collections: \(collections)")
        if let collection = ProcessInfo.processInfo.environment["collectionJSON"] {
            let collectionArr = collection.components(separatedBy: ",")
            URLProtocolMock.loadCollections(collectionNames: collectionArr)
        }
    }
}

extension String {
    public var hasCharacters: Bool {
        return replacingOccurrences(of: " ", with: "").isEmpty
    }
}
