//
//  GitHubSearchRepositoryListViewControllerBuilder.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/27.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

struct GitHubSearchRepositoryListViewControllerBuilder: ViewControllerBuilder {
    
    private init() {}
    
    typealias ViewController = GitHubSearchRepositoryListViewController
    
    static func build() -> ViewController {
        let vc = GitHubSearchRepositoryListViewController()
        let ui = GitHubSearchRepositoryUIImpl()
        let dataStore = GitHubSearchRepositoryListDataStoreImpl()
        let repository = GitHubSearchRepositoryListRepositoryImpl(dataStore: dataStore)
        let useCase = GitHubSearchRepositoryUseCaseImpl(repository: repository)
        let router = GitHubSearchRepositoryRouterImpl(viewController: vc)
        let presenter = GitHubSearchRepositoryPresenterImpl(view: vc, router: router, useCase: useCase)
        
        ui.viewController = vc
        vc.inject(ui: ui, presenter: presenter)
        
        return vc
    }
}
