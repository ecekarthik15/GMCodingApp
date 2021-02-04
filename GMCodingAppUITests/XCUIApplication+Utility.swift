//
//  XCUIApplication+Utility.swift
//  GMCodingAppUITests
//
//  Created by Karthik Kannan on 2/3/21.
//

import XCTest

public enum LaunchState {
    case install
    case freshInstall
}

public enum SuiteType: String {
    case ui = "XCUI-TEST"
    case integration = "INTEGRATION-TEST"
}

public extension XCUIApplication {
    func launch(state: LaunchState) {
        setenv("XCUI-TEST", "1", 1)
        App.shared.launchEnvironment["XCUI-TEST"] = "1"
        switch state {
        case .install:
            break
        case .freshInstall:
            break
        }
        App.shared.launch()
    }
    
    func sendCollection(fileNames: [String] = [],
                        launchState: LaunchState) {
        App.shared.launchEnvironment["collectionJSON"] = fileNames.joined(separator: ",")
        launch(state: launchState)
    }
}

