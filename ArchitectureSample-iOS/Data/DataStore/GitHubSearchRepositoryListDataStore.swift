//
//  GitHubSearchRepositoryListDataStore.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/15.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol GitHubSearchRepositoryListDataStore {
    func searchRepository(text: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

struct GitHubSearchRepositoryListDataStoreImpl: GitHubSearchRepositoryListDataStore {
    
    func searchRepository(text: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        APIClient().send(GitHubRequest(value: text)) { data, response, error in
            completion(data, response, error)
        }
    }
}
