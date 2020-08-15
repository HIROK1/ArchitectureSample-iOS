//
//  GitHubSearchRepositoryViewController.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/12.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class GitHubSearchRepositoryListViewController: UIViewController, GitHubSearchRepositoryPresenterView {
    
    private var ui: GitHubSearchRepositoryUI? {
        didSet {
            ui?.repositorySearchBar.delegate = self
            ui?.repositoryTableView.dataSource = self
            ui?.repositoryTableView.delegate = self
        }
    }
    
    private var presenter: GitHubSearchRepositoryPresenter?
    
    func inject(ui: GitHubSearchRepositoryUI, presenter: GitHubSearchRepositoryPresenter) {
        self.ui = ui
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        ui?.setup()
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

extension GitHubSearchRepositoryListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.didTapSearchButton(text: searchBar.text)
    }
}

extension GitHubSearchRepositoryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath)
    }
}

extension GitHubSearchRepositoryListViewController {
    func updateRepositorys() {
        print("didTapSearchButton")
    }
    
    func transitionToRepositoryDetails() {
        let vc = GitHubRepositoryDetailsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}