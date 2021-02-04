//
//  URL+Utility.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//


import Foundation

extension URL {
    public func createURLFromQueryDict(dict: [String: String]) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        let queryItems = dict.map {
            URLQueryItem(name: $0, value: $1)
        }
        if queryItems.count != 0 { components?.queryItems = queryItems }
        return components?.url ?? self
    }
    public func sortQueryParameters() -> URL {
        let queryDict = self.queryDict.sorted(by: { $0.0 < $1.0 })
        return createURLFromQueryDict(dict: Dictionary(uniqueKeysWithValues: queryDict))
    }
    
    var queryDict: [String: String] {
        let params = self.query?.components(separatedBy: "&").map({
            $0.components(separatedBy: "=")
        }).reduce(into: [String: String]()) { dict, pair in
            if pair.count == 2 {
                dict[pair[0]] = pair[1]
            }
        }
        return params ?? [String: String]()
    }
}
