//
//  SearchFormController+PickerViewDelegate.swift
//  Ryanair-Challenge
//
//  Created by Molnar, Peter, Vodafone Malta on 28/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import UIKit

let maxPeopleCount = 6

extension SearchFormController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case adultPicker:
            return maxPeopleCount
        case childPicker, teenPicker:
            return maxPeopleCount + 1
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case childPicker, teenPicker, adultPicker:
            return String(row)
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case childPicker:
            self.childCnt.text = String(row)
        case teenPicker:
            self.teenCnt.text = String(row)
        case adultPicker:
            self.adultsCnt.text = String(row + 1)
        default:
            return
        }
    }
}
