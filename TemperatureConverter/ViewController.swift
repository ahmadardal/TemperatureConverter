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
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperatureIntervals.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(temperatureIntervals[row]) ℃ "
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        let fahrenheit = converter.toFahrenheit(fromCelsius: temperatureIntervals[row])
        
        saveToDefault(row: row)
        
        lblResult.text = "\(String(fahrenheit)) ℉"
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

