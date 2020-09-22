//
//  GitHubRepositoryReadmeEntity.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/19.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

struct GitHubRepositoryReadmeEntity: Codable {
    let type: String?
    let encoding: String?
    let size: Int?
    let name: String?
    let path: String?
    let content: String?
    let sha: String?
    let url: String?
    let gitUrl: String?
    let htmlUrl: String?
    let downloadUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case type
        case encoding
        case size
        case name
        case path
        case content
        case sha
        case url
        case gitUrl = "git_url"
        case htmlUrl = "html_url"
        case downloadUrl = "download_url"
    }
}
