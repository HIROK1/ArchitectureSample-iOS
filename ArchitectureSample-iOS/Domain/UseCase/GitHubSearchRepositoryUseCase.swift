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
        
            guard let _data = data else { return completion(.failure(error!))}
            
            if let response = response as? HTTPURLResponse {
                Logger.apiResponseLogger(response, String(bytes: _data, encoding: .utf8) ?? "")
            }
            
            let decoder = JSONDecoder()
            
            do {
                let githubResponse = try decoder.decode(GitHubSearchRepositoryListEntity.self, from: _data)
                
                let repositories = GitHubRepositoriesTranslator.translate(githubResponse)
                print(repositories)
                completion(.success(repositories.repositories))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
    }
}
