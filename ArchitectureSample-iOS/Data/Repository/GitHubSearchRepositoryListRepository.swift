//
//  GitHubSearchRepositoryListRepository.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/15.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol GitHubSearchRepositoryListRepository: AnyObject {
    func searchRepository(text: String, completion: @escaping ((Result<GitHubSearchRepositoryListEntity, Error>) -> Void))
}

final class GitHubSearchRepositoryListRepositoryImpl: GitHubSearchRepositoryListRepository {

    private let dataStore: GitHubSearchRepositoryListDataStore
    
    init(dataStore: GitHubSearchRepositoryListDataStore) {
        self.dataStore = dataStore
    }
    
    func searchRepository(text: String, completion: @escaping ((Result<GitHubSearchRepositoryListEntity, Error>) -> Void)) {
        dataStore.searchRepository(text: text, completion: completion)
    }
}
