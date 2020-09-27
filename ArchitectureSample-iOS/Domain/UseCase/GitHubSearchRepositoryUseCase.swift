//
//  GitHubSearchRepositoryUseCase.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol GitHubSearchRepositoryUseCase: AnyObject {
    func searchRepository(text: String, completion: @escaping (Result<[GitHubRepositoryModel], Error>) -> Void)
}

final class GitHubSearchRepositoryUseCaseImpl: GitHubSearchRepositoryUseCase {
    
    private let repository: GitHubSearchRepositoryListRepository
    
    init(repository: GitHubSearchRepositoryListRepository) {
        self.repository = repository
    }
    
    func searchRepository(text: String, completion: @escaping (Result<[GitHubRepositoryModel], Error>) -> Void) {
        repository.searchRepository(text: text) { result in
            switch result {
            case .success(let entity):
                let repositories = GitHubRepositoriesTranslator.translate(entity)
                completion(.success(repositories.repositories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
