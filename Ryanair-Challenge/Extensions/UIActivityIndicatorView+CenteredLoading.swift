//
//  UIActivityIndicatorView+CenteredLoading.swift
//  Ryanair-Challenge
//
//  Created by Molnar, Peter, Vodafone Malta on 25/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import Foundation
import UIKit

extension UIActivityIndicatorView {
    
    func centeredLoading(for view: UIView) {
        self.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.center = view.center
        self.hidesWhenStopped = true
        self.style = UIActivityIndicatorView.Style.gray
    }
    
}
