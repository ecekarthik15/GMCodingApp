//
//  CommitsAccessIdentifiers.swift
//  GMCodingAppUITests
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation

public struct CommitsAccessIdentifiers {
    // MARK: - Labels
    public static let commitsCell = App.shared.cells["commits.tableview.cell"]
    
    public static let commitsFirstCell = App.shared.tables["commits.tableview"].cells.allElementsBoundByIndex.first
    
    public static let commitsShaLabel = App.shared.staticTexts["commits.tableview.cell.sha"]
    
    public static let commitsMessageLabel = App.shared.staticTexts["commits.tableview.cell.message"]
    
    public static let commitsAuthorLabel = App.shared.staticTexts["commits.tableview.cell.author"]

    public static let commitsDetailShaLabel = App.shared.staticTexts["commits.detail.sha"]
    
    public static let commitsDetailMessageLabel = App.shared.staticTexts["commits.detail.message"]
    
    public static let commitsDetailNameLabel = App.shared.staticTexts["commits.detail.name"]
    
    public static let commitsDetailDateLabel = App.shared.staticTexts["commits.detail.date"]

}
