//
//  GitHubSearchRepositoryListTableViewCell.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/07.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

final class GitHubSearchRepositoryListTableViewCell: UITableViewCell {
    
    static let this = "GitHubSearchRepositoryListTableViewCell"
    
    private(set) lazy var avatarImgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width * 0.5
        return imageView
    }()
    
    private(set) lazy var repositoryFullName: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        return label
    }()
    
    private(set) lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        return label
    }()
    
    private(set) lazy var stargazersCountLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
//        
//        addSubview(avatarImgImageView)
//        avatarImgImageView.translatesAutoresizingMaskIntoConstraints = false
//        avatarImgImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        avatarImgImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        avatarImgImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
//        avatarImgImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(repositoryFullName)
        repositoryFullName.translatesAutoresizingMaskIntoConstraints = false
        repositoryFullName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        repositoryFullName.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(repository: GitHubRepositoryModel) {
        repositoryFullName.text = repository.fullName
    }
}
