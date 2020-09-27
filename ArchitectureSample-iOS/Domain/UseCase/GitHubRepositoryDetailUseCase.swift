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
        repository.fetchReadme(owner: owner, repositoryName: repositoryName) { result in
            switch result {
            case .success(let entity):
                let readmeContent = GitHubRepositoryDetailTranslator.translate(entity)
                completion(.success(readmeContent))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
