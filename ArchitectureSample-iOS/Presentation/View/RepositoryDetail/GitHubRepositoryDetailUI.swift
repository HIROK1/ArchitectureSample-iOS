//
//  GitHubRepositoryDetailUI.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit
import Down

protocol GitHubRepositoryDetailUI: UI {
    var readmeContentView: DownView! { get }
    func setup()
    func setupReadmeContentView(readmeString: String)
}

final class GitHubRepositoryDetailUIImpl: GitHubRepositoryDetailUI {    
    
    weak var viewController: UIViewController?
    
    private(set) var readmeContentView: DownView!
    
}

extension GitHubRepositoryDetailUIImpl {
    
    func setup() {
        guard let vc = viewController else { return }
        
        vc.view.backgroundColor = .white
        vc.title = "README"
    }
    
    func setupReadmeContentView(readmeString: String) {
        readmeContentView = try? DownView(frame: .zero, markdownString: readmeString)
        guard let vc = viewController, let readmeContentView = readmeContentView else { return }
        
        vc.view.addSubview(readmeContentView)
        readmeContentView.translatesAutoresizingMaskIntoConstraints = false
        readmeContentView.topAnchor.constraint(equalTo: vc.view.topAnchor).isActive = true
        readmeContentView.leftAnchor.constraint(equalTo: vc.view.leftAnchor).isActive = true
        readmeContentView.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor).isActive = true
        readmeContentView.rightAnchor.constraint(equalTo: vc.view.rightAnchor).isActive = true
    }
}
