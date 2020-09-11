//
//  GitHubSearchRepositoryListRepository.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/15.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol GitHubSearchRepositoryListRepository: AnyObject {
    func searchRepository(text: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

protocol GitHubSearchRepositoryListRepositoryOutput: AnyObject {
    func updateRepositorys()
    func transitionToRepositoryDetails()
}

final class GitHubSearchRepositoryListRepositoryImpl: GitHubSearchRepositoryListRepository {

    private let dataStore: GitHubSearchRepositoryListDataStore
    
    init(dataStore: GitHubSearchRepositoryListDataStore) {
        self.dataStore = dataStore
    }
    
    func searchRepository(text: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        dataStore.searchRepository(text: text) { data, response, error in
            completion(data, response, error)
        }
    }
}
