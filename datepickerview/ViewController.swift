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

    var months: [String]?, monthselected: Int?
    var monthdays: [[Int]]?
    @IBOutlet weak var datePicker: UIPickerView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var uiDatePicker: UIDatePicker!
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
  
        monthdays = [Array(1...31), Array(1...28), Array(1...30)]
        monthselected = 1
        uiDatePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        self.title = "📆 Dynamic date picker 📅"
        background.image = #imageLiteral(resourceName: "backgroundone")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let componenets = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = componenets.day, let month = componenets.month, let year = componenets.year {
            print("\(day) \(month) \(year)")
            dateLabel.text = "Date selected: \(months![Int(month)-1])/\(day)/\(year)"
            datePicker.selectRow(Int(month)-1, inComponent:0, animated:true)
            datePicker.selectRow(Int(day)-1, inComponent:1, animated:true)
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            if component == 0 {
                monthselected = row+1
                pickerView.reloadAllComponents()
            }else{
                dateLabel.text = "Date selected: \(months![pickerView.selectedRow(inComponent: 0)])/\(monthdays![0][row])"
            }
        }else{
           print("toco el otro")
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
                return monthdays![0].count
            }else if monthselected == 2 {
                return monthdays![1].count
            }else {
                return monthdays![2].count
            }
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return months![row]
        }
            
        else {
            if monthselected == 1 || monthselected == 3 || monthselected == 5 || monthselected ==  7 || monthselected == 8 || monthselected == 10 || monthselected == 12 {
                return String(monthdays![0][row])
            }else if monthselected == 2 {
                return String(monthdays![1][row])
            }else {
                return String(monthdays![2][row])
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





