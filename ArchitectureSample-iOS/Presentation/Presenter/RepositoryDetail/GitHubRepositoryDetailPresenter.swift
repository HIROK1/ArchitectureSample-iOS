//
//  GitHubRepositoryDetailPresenter.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/20.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailPresenter: AnyObject {
    func fetchReadme(owner: String, repositoryName: String)
}

protocol GitHubRepositoryDetailPresenterView: AnyObject {
    func showReadme(readmeString: String)
    func showErrorAlert()
}
