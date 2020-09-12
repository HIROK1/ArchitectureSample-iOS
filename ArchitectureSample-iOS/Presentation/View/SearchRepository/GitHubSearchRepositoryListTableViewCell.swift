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
    
    private(set) lazy var allComponentstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(avatarImgImageView)
        stackView.addArrangedSubview(verticalStackView)
        return stackView
    }()

    private(set) lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(repositoryFullName)
        stackView.addArrangedSubview(horizontalStackView)
        return stackView
    }()
    
    private(set) lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(languageLabel)
        stackView.addArrangedSubview(stargazersCountLabel)
        return stackView
    }()
    
    private(set) lazy var avatarImgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
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
  
        addSubview(allComponentstackView)
        allComponentstackView.translatesAutoresizingMaskIntoConstraints = false
        allComponentstackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        allComponentstackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
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
        avatarImgImageView.setImage(with: URL(string: repository.avatarUrl.avatarUrl))
        repositoryFullName.text = repository.fullName
        languageLabel.text = repository.language
        stargazersCountLabel.text = String("⭐️\(repository.stargazersCount)")
    }
}
