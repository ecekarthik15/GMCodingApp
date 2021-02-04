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
}
