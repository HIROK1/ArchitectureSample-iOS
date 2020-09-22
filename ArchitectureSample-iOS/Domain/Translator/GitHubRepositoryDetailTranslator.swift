//
//  GitHubRepositoryReadmeTranslator.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/20.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

final class GitHubRepositoryDetailTranslator: Translator {
    typealias Input = GitHubRepositoryReadmeEntity
    typealias Output = GitHubRepositoryReadmeModel
    
    static func translate(_ entity: Input) -> Output {
        return GitHubRepositoryReadmeModel(readmeString: entity.content)
    }
}
