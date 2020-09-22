//
//  GitHubRepositoryDetailPresenterImpl.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/20.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

final class GitHubRepositoryDetailPresenterImpl: GitHubRepositoryDetailPresenter {
    
    private weak var view: GitHubRepositoryDetailPresenterView?
    
    private let useCase: GitHubRepositoryDetailUseCase
    
    init(view: GitHubRepositoryDetailPresenterView, useCase: GitHubRepositoryDetailUseCase) {
        self.view = view
        self.useCase = useCase
    }
    
    func fetchReadme(owner: String, repositoryName: String) {
        useCase.fetchReadme(owner: owner, repositoryName: repositoryName) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let model):
                guard let encodedData = Data(base64Encoded: model.readmeString, options: .ignoreUnknownCharacters) else { return }
                let decodedString = String(data: encodedData, encoding: .utf8)
                
                DispatchQueue.main.async {
                    self.view?.showReadme(readmeString: decodedString ?? "")
                }
                
            case .failure(let error):
                print(error)
                
                DispatchQueue.main.async {
                    self.view?.showErrorAlert()
                }
                
            }
        }
    }
}
