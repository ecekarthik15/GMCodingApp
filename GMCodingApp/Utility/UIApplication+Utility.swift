//
//  UIApplication+Utility.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation
import UIKit

extension UIApplication {
    public static var isUITesting: Bool {
        return ProcessInfo.processInfo.environment["UI-TEST"] == "1" || ProcessInfo.processInfo.environment["XCUI-TEST"] == "1"
    }
    public static var isIntegrationTesting: Bool {
        return ProcessInfo.processInfo.environment["INTEGRATION-TEST"] == "1"
    }
    public static var isUnitTesting: Bool {
        return ProcessInfo.processInfo.environment["XCInjectBundleInto"].exists
    }
    public static var isAutomationTesting: Bool {
        return isUITesting || isIntegrationTesting
    }
    public static var isTesting: Bool {
        return isUnitTesting || isUITesting || isIntegrationTesting
    }
}
