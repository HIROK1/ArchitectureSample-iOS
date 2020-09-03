//
//  GitHubSearchRepositoryListEntity.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/15.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

struct GitHubSearchRepositoryListEntity: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items = "items"
    }
}

struct Item: Codable {
    let id: Int
    let nodeId: String
    let name: String
    let fullName: String
    let owner: Owner
    let `private`: Bool
    let htmlUrl: String
    let description: String
    let fork: Bool
    let url: String
    let createdAt: String
    let updatedAt: String
    let pushedAt: String
    let homepage: String?
    let size: Int
    let stargazersCount: Int
    let watchersCount: Int
    let language: String?
    let forksCount: Int
    let openIssuesCount: Int
    let masterBranch: String?
    let defaultBranch: String
    let score: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeId = "node_id"
        case name = "name"
        case fullName = "full_name"
        case owner = "owner"
        case `private` = "private"
        case htmlUrl = "html_url"
        case description = "description"
        case fork = "fork"
        case url = "url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case homepage = "homepage"
        case size = "size"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language = "language"
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
        case masterBranch = "master_branch"
        case defaultBranch = "default_branch"
        case score = "score"
    }
}

struct Owner: Codable {
    let login: String
    let id: Int
    let nodeId: String
    let avatarUrl: String
    let gravatarId: String
    let url: String
    let receivedEventsUrl: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
        case url = "url"
        case receivedEventsUrl = "received_events_url"
        case type = "type"
    }
}
