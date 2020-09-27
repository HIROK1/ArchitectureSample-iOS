//
//  GitHubRepositoryDetailDataStore.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/19.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailDataStore {
    func fetchReadme(owner: String, repositoryName: String, completion: @escaping ((Result<GitHubRepositoryReadmeEntity, Error>) -> Void))
}

struct GitHubRepositoryDetailDataStoreImpl: GitHubRepositoryDetailDataStore {
    func fetchReadme(owner: String, repositoryName: String, completion: @escaping ((Result<GitHubRepositoryReadmeEntity, Error>) -> Void)) {
        APIClient().send(RepositoryReadmeRequest(owner: owner, repo: repositoryName), completion: completion)
    }
}
