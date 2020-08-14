//
//  GitHubSearchRepositoryViewController.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/12.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class GitHubSearchRepositoryListViewController: UIViewController, GitHubSearchRepositoryPresenterView {
    
    var ui: GitHubSearchRepositoryUI! {
        didSet {
            ui.repositoryTableView.dataSource = self
        }
    }
    
    var presenter: GitHubSearchRepositoryPresenter! {
        didSet {
            presenter.view = self
        }
    }
    
    func inject(ui: GitHubSearchRepositoryUI, presenter: GitHubSearchRepositoryPresenter) {
        self.ui = ui
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        ui.setup()
    }
}

extension GitHubSearchRepositoryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
