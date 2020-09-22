//
//  UIAlertController+Extension.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    class func createSimpleMessageAlert(title: String? = nil, message: String, completion: (() -> Void)? = nil) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ -> Void in
            if let completion = completion {
                completion()
            }
        }
        alert.addAction(action)
        
        return alert
    }
}
