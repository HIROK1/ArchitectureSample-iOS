//
//  GrayOutActivityIndicatorView.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

final class GrayOutActivityIndicatorView: UIView {

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        indicator.color = .white
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(activityIndicator)
        self.backgroundColor = .black
        self.alpha = 0.6
        self.isHidden = true
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        activityIndicator.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        activityIndicator.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension GrayOutActivityIndicatorView {
    func showActivityIndicator() {
        self.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        self.isHidden = true
        activityIndicator.stopAnimating()
    }
}

