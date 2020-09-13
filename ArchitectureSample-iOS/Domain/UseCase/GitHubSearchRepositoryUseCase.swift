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
        repository.searchRepository(text: text) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
        
            if let response = response as? HTTPURLResponse, let data = data {
                Logger.apiResponseLogger(response, String(bytes: data, encoding: .utf8) ?? "")
            }
            
            let decoder = JSONDecoder()
            
            do {
                guard let data = data else { return }
                let githubResponse = try decoder.decode(GitHubSearchRepositoryListEntity.self, from: data)
                let repositories = GitHubRepositoriesTranslator.translate(githubResponse)
                completion(.success(repositories.repositories))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
