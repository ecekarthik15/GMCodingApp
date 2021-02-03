//
//  CommitsResponse.swift
//  GMCodingApp
//
//  Created by Karthik Kannan on 2/3/21.
//

import Foundation

typealias CommitsResponse = [Commits]

// MARK: - Commits
struct Commits: Codable {
    let sha: String?
    let commit: Commit?
}

// MARK: - Commit
struct Commit: Codable {
    let author: CommitAuthor?
    let committer: CommitAuthor?
    let message: String?
}

// MARK: - CommitAuthor
struct CommitAuthor: Codable {
    let name: String?
    let email: String?
    let date: String?
}
