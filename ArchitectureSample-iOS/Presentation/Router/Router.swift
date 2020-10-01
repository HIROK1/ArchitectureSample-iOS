//
//  Router.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/30.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

protocol Router: AnyObject {
    var viewController: UIViewController? { get set }
    init(viewController: UIViewController)
}
