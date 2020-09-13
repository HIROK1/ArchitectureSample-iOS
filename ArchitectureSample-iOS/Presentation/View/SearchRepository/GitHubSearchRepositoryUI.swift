//
//  GitHubSearchRepositoryUI.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/12.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation
import UIKit

protocol GitHubSearchRepositoryUI: UI {
    var repositorySearchBar: UISearchBar { get }
    var repositoryTableView: UITableView { get }
    func setup()
}

final class GitHubSearchRepositoryUIImpl: GitHubSearchRepositoryUI {
    
    weak var viewController: UIViewController?
    
    private(set) lazy var repositorySearchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.placeholder = "Search Repository"
        searchBar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60)
        return searchBar
    }()
    
    private(set) lazy var repositoryTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .lightGray
        tableView.tableHeaderView = repositorySearchBar
        tableView.register(GitHubSearchRepositoryListTableViewCell.self, forCellReuseIdentifier: GitHubSearchRepositoryListTableViewCell.this)
        return tableView
    }()
}

extension GitHubSearchRepositoryUIImpl {
    func setup() {
        guard let vc = viewController else { return }
        
        vc.view.addSubview(repositoryTableView)
        repositoryTableView.translatesAutoresizingMaskIntoConstraints = false
        repositoryTableView.topAnchor.constraint(equalTo: vc.view.topAnchor).isActive = true
        repositoryTableView.leftAnchor.constraint(equalTo: vc.view.leftAnchor).isActive = true
        repositoryTableView.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor).isActive = true
        repositoryTableView.rightAnchor.constraint(equalTo: vc.view.rightAnchor).isActive = true
    }
}
