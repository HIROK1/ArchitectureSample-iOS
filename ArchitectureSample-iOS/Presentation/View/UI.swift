//
//  UI.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/12.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation
import UIKit

protocol UI: AnyObject {
    var viewController: UIViewController? { get set }
}
