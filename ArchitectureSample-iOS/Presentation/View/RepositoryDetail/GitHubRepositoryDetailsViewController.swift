//
//  GitHubRepositoryDetailsViewController.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class GitHubRepositoryDetailsViewController: UIViewController {
    
    private lazy var repositoryFullNameLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        view.addSubview(repositoryFullNameLabel)
        repositoryFullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        repositoryFullNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        repositoryFullNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    func configure(text: String) {
        repositoryFullNameLabel.text = text
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
