//
//  URLSessionConfiguration+Swizzling.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation

let swizzleDefaultSessionConfiguration: Void = {
    let defaultSessionConfiguration = class_getClassMethod(URLSessionConfiguration.self,
                                                           #selector(getter: URLSessionConfiguration.default))
    let mockingDefaultSessionConfiguration = class_getClassMethod(URLSessionConfiguration.self,
                                                                  #selector(URLSessionConfiguration.mockingDefaultSessionConfiguration))
    method_exchangeImplementations(defaultSessionConfiguration!, mockingDefaultSessionConfiguration!)
    
}()

extension URLSessionConfiguration {
    /// Swizzles NSURLSessionConfiguration's default sessions
    @objc public class func mockingSwizzleDefaultSessionConfiguration() {
        _ = swizzleDefaultSessionConfiguration
    }
    
    @objc class func mockingDefaultSessionConfiguration() -> URLSessionConfiguration {
        let configuration = mockingDefaultSessionConfiguration()
        configuration.protocolClasses = [URLProtocolMock.self] as [AnyClass] + configuration.protocolClasses!
        return configuration
    }
}

extension URLSession {
    private struct SessionStore {
        static var sharedSession: URLSession?
    }
    @objc class func mockSharedSession() {
        let sharedSession = class_getClassMethod(URLSession.self, #selector(getter: URLSession.shared))
        let swizzledSharedSession = class_getClassMethod(URLSession.self, #selector(getMockSharedSession))
        method_exchangeImplementations(sharedSession!, swizzledSharedSession!)
    }
    @objc class private func getMockSharedSession() -> URLSession {
        if let session = SessionStore.sharedSession {
            return session
        } else {
            let configuration = URLSessionConfiguration.default
            let newSharedSession = URLSession(configuration: configuration)
            SessionStore.sharedSession = newSharedSession
            return newSharedSession
        }
    }
}
