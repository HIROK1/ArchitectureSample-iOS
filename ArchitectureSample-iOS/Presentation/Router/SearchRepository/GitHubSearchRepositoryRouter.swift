//
//  SearchRepositoryRouter.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/30.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

protocol GitHubSearchRepositoryRouter: Router {
    func transitionToRepositoryDetail(owner: String, repositoryName: String)
}

final class GitHubSearchRepositoryRouterImpl: GitHubSearchRepositoryRouter {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func transitionToRepositoryDetail(owner: String, repositoryName: String) {
        let nextVC = GitHubRepositoryDetailViewControllerBuilder.build()
        nextVC.setupReadme(owner: owner, repositoryName: repositoryName)
        self.viewController?.navigationController?.pushViewController(nextVC, animated: true)
    }
}
