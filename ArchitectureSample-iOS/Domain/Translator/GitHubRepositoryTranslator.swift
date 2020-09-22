//
//  GithubRepositoryTranslator.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/03.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

final class GitHubRepositoriesTranslator: Translator {
    typealias Input = GitHubSearchRepositoryListEntity
    typealias Output = GitHubRepositoriesModel
    
    static func translate(_ entity: Input) -> Output {
        let repositories: [GitHubRepositoryModel] = entity.items.map {
            GitHubRepositoryTranslator.translate($0)
        }
        
        return GitHubRepositoriesModel(repositories: repositories)
    }
}

final class GitHubRepositoryTranslator: Translator {
    typealias Input = Item
    typealias Output = GitHubRepositoryModel
    
    static func translate(_ entity: Item) -> GitHubRepositoryModel {
        let name = entity.name
        let avatarUrl = GitHubRepositoryOwnerTranslator.translate(entity.owner)
        let fullName = entity.fullName
        let language = entity.language ?? ""
        let stargazersCount = entity.stargazersCount
        
        return GitHubRepositoryModel(name: name, avatarUrl: avatarUrl, fullName: fullName, language: language, stargazersCount: stargazersCount)
    }
}

final class GitHubRepositoryOwnerTranslator: Translator {
    typealias Input = Owner
    typealias Output = GitHubRepositoryOwnerModel
    
    static func translate(_ entity: Input) -> Output {
        let login = entity.login
        let avatarUrl = entity.avatarUrl
        
        return GitHubRepositoryOwnerModel(login: login, avatarUrl: avatarUrl)
    }
    
}
