//
//  ViewController.swift
//  datepickerview
//
//  Created by MCS Devices on 11/1/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var february: [Int]?, montha: [Int]?, monthb: [Int]?, months: [String]?, monthselected: Int?
    var monthdays: [[Int]]?
    @IBOutlet weak var datePicker: UIPickerView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        months = ["January","February","March","April","May","June","July","Augost","September","October","November","December"]
        february = Array(0...28)
        montha = Array(0...30)
        monthb = Array(0...31)
        monthdays = [Array(0...31), Array(0...28), Array(0...30)]
        monthselected = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            if component == 0 {
                monthselected = row+1
                pickerView.reloadAllComponents()
            }else{
                dateLabel.text = "Date selected: \(months![pickerView.selectedRow(inComponent: 0)])/\(monthb![row])"
            }
        }else{
            //
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //row = [repeatPickerView selectedRowInComponent:0];
        //var row = pickerView.selectedRowInComponent(0)
        //println("this is the pickerView\(row)")
        
        if component == 0 {
            return months!.count
        }
            
        else {
           
            if monthselected == 1 || monthselected == 3 || monthselected == 5 || monthselected ==  7 || monthselected == 8 || monthselected == 10 || monthselected == 12 {
                return monthb!.count
            }else if monthselected == 2 {
                return february!.count
            }else {
                return montha!.count
            }
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        if component == 0 {
            return months![row]
        }
            
        else {
            if monthselected == 1 || monthselected == 3 || monthselected == 5 || monthselected ==  7 || monthselected == 8 || monthselected == 10 || monthselected == 12 {
                return String(monthb![row])
            }else if monthselected == 2 {
                return String(february![row])
            }else {
                return String(montha![row])
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        if pickerView.tag == 1{
            return 2
        }else{
            return 1
        }
    }
}





