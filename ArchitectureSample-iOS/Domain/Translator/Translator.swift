//
//  Translator.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/03.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol Translator: AnyObject {
    associatedtype Input
    associatedtype Output
    
    static func translate(_ entity: Input) -> Output
}
