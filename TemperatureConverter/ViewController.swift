//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Ahmad Ardal on 2022-09-02.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var myPickerView: UIPickerView!
    
    @IBOutlet var lblResult: UILabel!
    
    var temperatureIntervals = (-100...100).map{$0}
    
    var converter = Converter()
    
    var lastValue = "lastValue"
    
    var convertTo = "Fahrenheit"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        for index in -100...100 {
        //            temperatureIntervals.append(index)
        //        }
        
        myPickerView.selectRow(getInitialValue(), inComponent: 0, animated: false)
        
        
        pickerView(myPickerView, didSelectRow: getInitialValue(), inComponent: 0)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 2
        case 1:
            return temperatureIntervals.count
        default: return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            switch row {
            case 0: return "Fahrenheit"
            case 1: return "Celsius"
            default: return "Fahrenheit"
            }
        } else {
            if convertTo == "Fahrenheit" {
                return "\(temperatureIntervals[row]) ℃ "
            } else {
                return "\(temperatureIntervals[row]) ℉ "
            }
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            if row == 0 {
                convertTo = "Fahrenheit"
            } else {
                convertTo = "Celsius"
            }
            
            pickerView.reloadComponent(1)
        } else {
            
            
            if convertTo == "Celsius" {
                let celsius = converter.toCelsius(fromFahrenheit: temperatureIntervals[row])
                saveToDefault(row: row)
                lblResult.text = "\(String(celsius)) ℃"
            } else {
                let fahrenheit = converter.toFahrenheit(fromCelsius: temperatureIntervals[row])
                saveToDefault(row: row)
                lblResult.text = "\(String(fahrenheit)) ℉"
            }
            
            
        }
        
        
        
    }
    
    
    func getInitialValue() -> Int {
        
        //let savedRow = UserDefaults.standard.integer(forKey: lastValue)
        
        let savedRow = UserDefaults.standard.object(forKey: lastValue) as? Int
        
        if let row = savedRow {
            return row
        } else {
            return 100
        }
    }
    
    func saveToDefault(row: Int) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(row, forKey: lastValue)
        
        defaults.synchronize()
        
    }
    
}

