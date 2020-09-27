//
//  GitHubRepositoryDetailsViewController.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

final class GitHubRepositoryDetailViewController: UIViewController {
    
    var ui: GitHubRepositoryDetailUI! {
        didSet {
            ui.viewController = self
        }
    }
    
    var presenter: GitHubRepositoryDetailPresenter!
    
    func inject(ui: GitHubRepositoryDetailUI, presenter: GitHubRepositoryDetailPresenter) {
        self.ui = ui
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ui.setup()
    }
    
    func fetchReadme(owner: String, repositoryName: String) {
        presenter.fetchReadme(owner: owner, repositoryName: repositoryName)
    }
}

// MARK - GitHubRepositoryDetailPresenterView
extension GitHubRepositoryDetailViewController: GitHubRepositoryDetailPresenterView {
    
    func showReadme(readmeString: String) {
        ui.setupReadmeContentView(readmeString: readmeString)
    }
    
    func showErrorAlert() {
        let alert = UIAlertController.createSimpleMessageAlert(message: "READMEを取得できませんでした。") { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        self.present(alert, animated: true)
    }
}
