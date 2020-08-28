//
//  SearchFormController.swift
//  Ryanair-Challenge
//
//  Created by Peter Molnar  on 25/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//
import Foundation
import UIKit


class SearchFormController: UIViewController {
    @IBOutlet var origin: UITextField!
    @IBOutlet var destination: UITextField!
    @IBOutlet var adultsCnt: UITextField!
    @IBOutlet var teenCnt: UITextField!
    @IBOutlet var childCnt: UITextField!
    @IBOutlet var departureDate: UITextField!
    @IBOutlet var mainSearchStackView: UIStackView!
    
    var adultPicker = UIPickerView()
    var childPicker = UIPickerView()
    var teenPicker = UIPickerView()
    
    let dateFormatter = DateFormatter()
    
    // MARK: Viewcontroller lifecycle
    override func viewDidLoad() {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        setupPickers()
        setupDefaultValues()
    }
    
    func setupPickers() {
        self.departureDate.setInputViewDatePicker(target: self, selector: #selector(dateSelected))
        
        adultPicker.dataSource = self
        adultPicker.delegate = self
        self.adultsCnt.setPickerInputView(picker: adultPicker)
        
        teenPicker.dataSource = self
        teenPicker.delegate = self
        self.teenCnt.setPickerInputView(picker: teenPicker)
        
        childPicker.dataSource = self
        childPicker.delegate = self
        self.childCnt.setPickerInputView(picker: childPicker)
    }
    
    func setupDefaultValues() {
        let now = dateFormatter.string(from: Date())
        self.departureDate.text = now
        self.adultsCnt.text = "1"
        self.teenCnt.text = "0"
        self.childCnt.text = "0"

    }
    
    // MARK: DatePicker selector
    @objc func dateSelected() {
        if let datePicker = self.departureDate.inputView as? UIDatePicker {
            self.departureDate.text = dateFormatter.string(from: datePicker.date)
        }
        self.departureDate.resignFirstResponder()
    }
    
    // MARK: Segue preparation
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startSearch" {
            if let destinationVC = segue.destination as? ResultsViewController {
                destinationVC.queryParameters = self.makeFormParameters()
            }
        }
    }
    
    // MARK: Helper functions
    
    // Creating a dictionary from the form input, and preparing to the search query
    func makeFormParameters() -> [String: String] {
        var parameterList = [String: String]()
         
        parameterList[queryOrigin] = self.origin.text ?? ""
        parameterList[queryDestination] = self.destination.text ?? ""
        parameterList[queryDateOut] = self.departureDate.text ?? ""
        parameterList[queryAdult] = self.adultsCnt.text?.isEmpty ?? true ? "1" : self.adultsCnt.text
        parameterList[queryTeen] = self.teenCnt.text?.isEmpty ?? true ? "0" : self.teenCnt.text
        parameterList[queryChild] = self.childCnt.text?.isEmpty ?? true ? "0" : self.childCnt.text
        parameterList["ToUs"] = "AGREED"
        
        return parameterList
    }
}
