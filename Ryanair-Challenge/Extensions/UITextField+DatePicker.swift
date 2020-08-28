//
//  UITextField+DatePicker.swift
//  Ryanair-Challenge
//
//  Created by Molnar, Peter, Vodafone Malta on 28/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import UIKit

// Extension for triggering date picker on a given textfield.
extension UITextField {
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
        // Creating a UIDatePicker and assigning to the inputView
        let picker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 250))
        picker.datePickerMode = .date
        self.inputView = picker
        self.inputAccessoryView = self.makeToolbar(target: target, selector: selector)
    }
    
    func makeToolbar(target: Any, selector: Selector) -> UIToolbar {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(tapCancel))
        let doneButton = UIBarButtonItem(title: "Select" , style: .plain, target: target, action: selector)
        toolBar.setItems([cancelButton, flexibleSpace, doneButton], animated: false)
        
        return toolBar
    }
    
    // Handling from the datepicker toolbar cancel button
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}
