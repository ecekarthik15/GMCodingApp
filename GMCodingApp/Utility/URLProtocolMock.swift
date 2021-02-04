//
//  URLProtocolMock.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation

public class URLProtocolMock: URLProtocol {
    
    let decoder = JSONDecoder()

    public static var mockDataModel = [UIMockJSONDataModel]()
    
    // say we want to handle all types of request
    public override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    // ignore this method; just send back what we were given
    public override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    public override func startLoading() {
        // if we have a valid URL…
        if var url = request.url {
            // …and if we have test data for that URL…
            url = url.sortQueryParameters()
            if let status = URLProtocolMock.mockDataModel.status(for: url.absoluteString),
                let model = URLProtocolMock.mockDataModel.model(for: url.absoluteString) {
                // …load it immediately.
                self.client?.urlProtocol(self, didLoad: URLProtocolMock.responseData(model: model) ?? Data())
                self.client?.urlProtocol(self, didReceive: HTTPURLResponse(url: url,
                                                                           statusCode: status,
                                                                           httpVersion: "",
                                                                           headerFields: model.headerFields ?? ["": ""])!,
                                         cacheStoragePolicy: URLCache.StoragePolicy.notAllowed)
                if let deleteEntry = URLProtocolMock.mockDataModel.delete(for: url.absoluteString),
                    let index = URLProtocolMock.mockDataModel.index(for: url.absoluteString),
                    deleteEntry {
                    URLProtocolMock.mockDataModel.remove(at: index)
                }
            } else {
                print("unable to mock url: ", url, ": ", URLProtocolMock.mockDataModel.status(for: url.absoluteString) as Any)
            }
        }
        
        // mark that we've finished
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    // this method is required but doesn't need to do anything
    public override func stopLoading() { }
    
    // this method updates the mock data model from CollectionJSON
    public static func loadCollections(collectionNames: [String]) {
        if collectionNames.count > 0 {
            collectionNames.forEach { name in
                let mockDataModel = URLProtocolMock.loadDataFromJSON(collectionName: name) ?? []
                let sortedMockData = sortCollectionUrls(mockDataModel: mockDataModel)
                URLProtocolMock.mockDataModel += sortedMockData
            }
        }
    }
    
    // this method updates the mock data model from CollectionJSON
    public static func updateCollections(collectionNames: [String]) {
        if collectionNames.count > 0 {
            URLProtocolMock.mockDataModel.removeAll()
            collectionNames.forEach { name in
                let mockDataModel = URLProtocolMock.loadDataFromJSON(collectionName: name) ?? []
                let sortedMockData = sortCollectionUrls(mockDataModel: mockDataModel)
                URLProtocolMock.mockDataModel += sortedMockData
            }
        }
    }
    
    private static func sortCollectionUrls(mockDataModel: [UIMockJSONDataModel]) -> [UIMockJSONDataModel] {
        var sortedMockData = [UIMockJSONDataModel]()
        mockDataModel.forEach { data in
            guard let url = URL(string: data.url) else { return }
            let sortedUrl = url.sortQueryParameters()
            sortedMockData.append(UIMockJSONDataModel(url: sortedUrl.absoluteString, value: data.value))
        }
        return sortedMockData
    }
    
    // this method loads the collection json as UIMockJSONDataModel
    private static func loadDataFromJSON(collectionName: String) -> [UIMockJSONDataModel]? {
        let decoder = JSONDecoder()
        do {
            guard let data = URLProtocolMock.collectionData(fileName: collectionName) else {
                return nil
            }
            return try decoder.decode([UIMockJSONDataModel].self, from: data)
        } catch {
            return nil
        }
    }
    
    private static func collectionData(fileName: String) -> Data? {
        guard let stubCollection = stubCollectionPath() else { return nil }
        let enumerator = FileManager.default.enumerator(atPath: stubCollection)
        var completeFilePath = ""
        while let filePath = enumerator?.nextObject() as? String {
            if fileName == URL(fileURLWithPath: filePath).deletingPathExtension().lastPathComponent {
                completeFilePath = stubCollection + "/" + filePath
            }
        }
        
        return getData(atRelativePath: completeFilePath)
    }
    
    private static func getData(atRelativePath path: String) -> Data? {
        do {
            return try Data(contentsOf: URL(fileURLWithPath: path))
        } catch {
            return nil
        }
    }
    
    //Returns Data for the associated Request
    private static func responseData(model: UIMockJSONDataValuesModel) -> Data? {
        guard let bundle = URLProtocolMock.jsonBundle(), let filepath = bundle.path(model: model) else {
            return nil
        }
        do {
            return try Data(contentsOf: URL(fileURLWithPath: filepath))
        } catch {
            return nil
        }
    }
    
    //Returns MockJSON Bundle
    private static func jsonBundle() -> Bundle? {
        guard let bundlePath = Bundle.main.path(forResource: "UIJsonMock", ofType: "bundle"), let bundle = Bundle(path: bundlePath) else {
            return nil
        }
        return bundle
    }
    
    //Returns path to iOSStubCollection folder
    private static func stubCollectionPath() -> String? {
        guard let bundle = URLProtocolMock.jsonBundle() else {
            return nil
        }
        
        let filepath = bundle.resourceURL?.appendingPathComponent("iOSStubCollection")
        return filepath?.path
    }
}

//Extensions
extension Bundle {
    func path(model: UIMockJSONDataValuesModel) -> String? {
        if let xmlFile = model.xmlFileName {
            return path(forResource: xmlFile, ofType: "xml", inDirectory: model.directory)
        }
        return path(forResource: model.jsonFileName, ofType: "json", inDirectory: model.directory)
    }
}
