//
//  GitHubRepositoryDetailRepository.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/20.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailRepository: AnyObject {
    func fetchReadme(owner: String, repositoryName: String, completion: @escaping ((Result<GitHubRepositoryReadmeEntity, Error>) -> Void))
}

final class GitHubRepositoryDetailRepositoryImpl: GitHubRepositoryDetailRepository {
    
    private let dataStore: GitHubRepositoryDetailDataStore
    
    init(dataStore: GitHubRepositoryDetailDataStore) {
        self.dataStore = dataStore
    }
    
    func fetchReadme(owner: String, repositoryName: String, completion: @escaping ((Result<GitHubRepositoryReadmeEntity, Error>) -> Void)) {
        dataStore.fetchReadme(owner: owner, repositoryName: repositoryName, completion: completion)
    }
}
