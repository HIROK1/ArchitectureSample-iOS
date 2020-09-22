//
//  GitHubSearchRepositoryModel.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/03.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

struct GitHubRepositoriesModel {
    var repositories: [GitHubRepositoryModel] = []
}

struct GitHubRepositoryModel {
    let name: String
    let avatarUrl: GitHubRepositoryOwnerModel
    let fullName: String
    let language: String
    let stargazersCount: Int
}

struct GitHubRepositoryOwnerModel {
    let login: String
    let avatarUrl: String
}
