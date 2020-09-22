//
//  GitHubRepositoryDetailUseCase.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/20.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailUseCase: AnyObject {
    func fetchReadme(owner: String, repositoryName: String, completion: @escaping (Result<GitHubRepositoryReadmeModel, Error>) -> Void)
}

final class GitHubRepositoryDetailUseCaseImpl: GitHubRepositoryDetailUseCase {
    
    private let repository: GitHubRepositoryDetailRepository
    
    init(repository: GitHubRepositoryDetailRepository) {
        self.repository = repository
    }

    func fetchReadme(owner: String, repositoryName: String, completion: @escaping (Result<GitHubRepositoryReadmeModel, Error>) -> Void) {
        repository.fetchReadme(owner: owner, repositoryName: repositoryName) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            if let response = response as? HTTPURLResponse, let data = data {
                Logger.apiResponseLogger(response, String(bytes: data, encoding: .utf8) ?? "")
            }
            
            do {
                guard let data = data else { return }
                let githubResponse = try JSONDecoder().decode(GitHubRepositoryReadmeEntity.self, from: data)
                let readmeContent = GitHubRepositoryDetailTranslator.translate(githubResponse)
                completion(.success(readmeContent))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
