//
//  UIMockJSONDataValuesModel.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation

public struct UIMockJSONDataValuesModel: Codable {
    let status: Int
    let jsonFileName: String
    let xmlFileName: String?
    let directory: String
    let delete: Bool?
    let omitItems: [String]?
    let headerFields: [String: String]?
}

public struct UIMockJSONDataModel: Codable {
    let url: String
    let value: UIMockJSONDataValuesModel
}

private func isSameAs(lhs: String, rhs: String, omitItems: [String]?) -> Bool {
    
    return lhs == rhs || isSameComponentAs(lhs: URLComponents(string: lhs)!, rhs: URLComponents(string: rhs)!, omitItems: omitItems)
}

private func isSameComponentAs(lhs: URLComponents?, rhs: URLComponents?, omitItems: [String]?) -> Bool {
    var lhsItems = lhs?.queryItems?.compactMap { $0 }
        .sorted(by: { $0.name > $1.name })
    var rhsItems = rhs?.queryItems?.compactMap { $0 }
        .sorted(by: { $0.name > $1.name })
    
    if let omitItems = omitItems {
        for name in omitItems {
            lhsItems?.removeAll(where: { $0.name == name })
            rhsItems?.removeAll(where: { $0.name == name })
        }
    }
    
    return lhs?.host == rhs?.host &&
        lhs?.scheme == rhs?.scheme &&
        lhs?.path == rhs?.path &&
        lhsItems == rhsItems
}

extension Array where Element == UIMockJSONDataModel {
    func status(for url: String) -> Int? {
        return first { isSameAs(lhs: $0.url, rhs: url, omitItems: $0.value.omitItems) }?.value.status
    }
    
    func json(for url: String) -> String? {
        return first { isSameAs(lhs: $0.url, rhs: url, omitItems: $0.value.omitItems) }?.value.jsonFileName ?? ""
    }
    
    func model(for url: String) -> UIMockJSONDataValuesModel? {
        return first { isSameAs(lhs: $0.url, rhs: url, omitItems: $0.value.omitItems) }?.value
    }
    
    func delete(for url: String) -> Bool? {
        return first { isSameAs(lhs: $0.url, rhs: url, omitItems: $0.value.omitItems) }?.value.delete
    }
    
    func index(for url: String) -> Int? {
        return firstIndex(where: { isSameAs(lhs: $0.url, rhs: url, omitItems: $0.value.omitItems) })
    }
}
