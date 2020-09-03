//
//  ViewControllerBuilder.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/27.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

protocol ViewControllerBuilder {
    associatedtype ViewController: UIViewController
    
    static func build() -> ViewController
}
