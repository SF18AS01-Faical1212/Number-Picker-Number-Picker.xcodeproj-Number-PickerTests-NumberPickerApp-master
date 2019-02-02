//
//  ViewController.swift
//  NumberPicker
//
//  Created by Faical Sawadogo1212 01/12/2019.
//  Copyright © 2019 Faical Sawadogo1212. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UIPickerViewDelegate,
    UIPickerViewDataSource
{
    
    @IBOutlet weak var pickerValue: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
    }
    
    // UIPickerViewDataSource required method
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // Digit, decimal point, digit
        return 4
    }
    
    // UIPickerViewDataSource required method
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        if component == 2 {
            // Component 1 is the decimal point
            return 1
        } else {
            // Components 0 and 2 may have values 0 - 9
            return 10
        }
    }
    
    // UIPickerViewDelegate method
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if component == 2 {
            // Decimal point in the middle
            return "."
        } else {
            // Get the component's value
            let numberString = NSString(format: "%d", row) as String
            return numberString
        }
    }
    
    // UIPickerViewDelegate method
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        // Picker changed, get the component values
        let d0 = picker.selectedRow(inComponent: 0)
        let d1 = picker.selectedRow(inComponent: 1)
        let d3 = picker.selectedRow(inComponent: 3)
        
        
        // Set the label's text
        let numberString = NSString(format: "%d%d.%d", d0, d1, d3)
        pickerValue.text = numberString as String
    }
    
    // UIPickerViewDelegate method
    func pickerView(_ pickerView: UIPickerView,
                    widthForComponent component: Int) -> CGFloat {
        return 25.0
    }
}

