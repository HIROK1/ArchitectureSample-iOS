//
//  GitHubSearchRepositoryPresenter.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/13.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol GitHubSearchRepositoryPresenter: AnyObject {
    func didSelectRow(at indexPath: IndexPath)
    func didTapSearchButton(text: String?)
}

protocol GitHubSearchRepositoryPresenterView: AnyObject {
    func updateRepositories(model: [GitHubRepositoryModel])
    func transitionToRepositoryDetails()
}
