//
//  GitHubSearchRepositoryPresenterImpl.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/13.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

final class GitHubSearchRepositoryPresenterImpl: GitHubSearchRepositoryPresenter {
    
    var router: GitHubSearchRepositoryRouter
    
    var repositories: [GitHubRepositoryModel] = []
    
    private weak var view: GitHubSearchRepositoryPresenterView?
    
    private let useCase: GitHubSearchRepositoryUseCase
    
    init(view: GitHubSearchRepositoryPresenterView, router: GitHubSearchRepositoryRouter, useCase: GitHubSearchRepositoryUseCase) {
        self.view = view
        self.router = router
        self.useCase = useCase
    }
    
    func didTapSearchButton(text: String) {
        useCase.searchRepository(text: text) { result in
            DispatchQueue.main.sync {
                self.view?.stopActivityIndicator()
            }
            
            switch result {
            case .success(let model):
                DispatchQueue.main.sync {
                    self.repositories = model
                    self.view?.updateRepositories()
                }
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        router.transitionToRepositoryDetail(owner: repositories[indexPath.row].avatarUrl.login,
                                            repositoryName: repositories[indexPath.row].name)
    }
}
