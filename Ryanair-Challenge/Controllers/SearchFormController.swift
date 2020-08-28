//
//  SearchFormController.swift
//  Ryanair-Challenge
//
//  Created by Molnar, Peter, Vodafone Malta on 25/08/2020.
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
    
    // MARK: Viewcontroller lifecycle
    override func viewDidLoad() {
        self.departureDate.setInputViewDatePicker(target: self, selector: #selector(dateSelected))
    }
    
    // MARK: DatePicker selector
    @objc func dateSelected() {
        if let datePicker = self.departureDate.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
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
    
    // Crating a dictionary from the form input, and preparing to the search query
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
