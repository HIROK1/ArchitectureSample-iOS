//
//  GitHubRepositoryDetailViewControllerBuilder.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/20.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

struct GitHubRepositoryDetailViewControllerBuilder: ViewControllerBuilder {
    
    private init() {}
    
    typealias ViewController = GitHubRepositoryDetailViewController
    
    static func build() -> ViewController {
        let vc = GitHubRepositoryDetailViewController()
        let ui = GitHubRepositoryDetailUIImpl()
        let dataStore = GitHubRepositoryDetailDataStoreImpl()
        let repository = GitHubRepositoryDetailRepositoryImpl(dataStore: dataStore)
        let useCase = GitHubRepositoryDetailUseCaseImpl(repository: repository)
        let presenter = GitHubRepositoryDetailPresenterImpl(view: vc, useCase: useCase)
        
        vc.inject(ui: ui, presenter: presenter)
        return vc
    }
}
