//
//  GitHubSearchRepositoryPresenterImpl.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/13.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

final class GitHubSearchRepositoryPresenterImpl: GitHubSearchRepositoryPresenter {
    
    private weak var view: GitHubSearchRepositoryPresenterView?
    
    private let useCase: GitHubSearchRepositoryUseCase
    
    init(view: GitHubSearchRepositoryPresenterView, useCase: GitHubSearchRepositoryUseCase) {
        self.view = view
        self.useCase = useCase
    }
    
    func didTapSearchButton(text: String) {
        useCase.searchRepository(text: text) { result in
            switch result {
            case .success(let model):
                DispatchQueue.main.sync {
                    self.view?.updateRepositories(model: model)
                }
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        self.view?.transitionToRepositoryDetails(indexPath: indexPath)
    }
}
