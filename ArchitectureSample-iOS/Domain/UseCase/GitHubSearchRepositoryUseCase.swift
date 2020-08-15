//
//  GitHubSearchRepositoryUseCase.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol SearchRepositoryUseCase {
    func searchRepositories()
    func transitionToRepositoryDetails()
}

protocol SearchRepositoryUseCaseOutput {
    <#requirements#>
}

final class SearchRepositoryUseCaseImpl: SearchRepositoryUseCase {
    weak var presenter: GitHubSearchRepositoryPresenterView?
    
    func searchRepositories() {
        presenter?.updateRepositorys()
    }
    
    func transitionToRepositoryDetails() {
        presenter?.transitionToRepositoryDetails()
    }
}
