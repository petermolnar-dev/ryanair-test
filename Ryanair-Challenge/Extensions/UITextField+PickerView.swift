//
//  UITextField+PickerView.swift
//  Ryanair-Challenge
//
//  Created by Peter Molnar  on 28/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setPickerInputView(picker: UIPickerView) {
        self.inputView = picker
        self.inputAccessoryView = self.makeToolbar(target: self, selector: #selector(tapDone))
    }
    
    @objc func tapDone() {
        self.resignFirstResponder()
    }
}
