//
//  GitHubSearchRepositoryPresenter.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/13.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol GitHubSearchRepositoryPresenter {
    var view: GitHubSearchRepositoryPresenterView! { get set }
}

protocol GitHubSearchRepositoryPresenterView: AnyObject {
    func inject(ui: GitHubSearchRepositoryUI, presenter: GitHubSearchRepositoryPresenter)
}
