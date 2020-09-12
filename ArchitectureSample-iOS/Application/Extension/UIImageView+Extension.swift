//
//  UIImageView+Extension.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/11.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Nuke
import UIKit

extension UIImageView {
    
    func setImage(with imageUrl: URL?) {
        guard let imageUrl = imageUrl else { return }
        
        Nuke.loadImage(with: imageUrl, into: self)
    }
}
