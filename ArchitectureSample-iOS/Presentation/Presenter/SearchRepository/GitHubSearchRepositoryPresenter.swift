//
//  GitHubSearchRepositoryPresenter.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/13.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol GitHubSearchRepositoryPresenter: AnyObject {
    var router: GitHubSearchRepositoryRouter { get }
    var repositories: [GitHubRepositoryModel] { get set }
    func didSelectRow(at indexPath: IndexPath)
    func didTapSearchButton(text: String)
}

protocol GitHubSearchRepositoryPresenterView: AnyObject {
    func updateRepositories()
    func showActivityIndicator()
    func stopActivityIndicator()
}
