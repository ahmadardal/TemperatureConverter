//
//  Converter.swift
//  TemperatureConverter
//
//  Created by Ahmad Ardal on 2022-09-02.
//

import Foundation

class Converter {
    
    func toFahrenheit(fromCelsius: Int) -> Int {
        
        let fahrenheit = (1.8 * Double(fromCelsius)) + 32.0

        return Int(round(fahrenheit))
    }
    
    func toCelsius(fromFahrenheit: Int) -> Int {
        
        let celsius = (Double(fromFahrenheit) - 32.0) / 1.8
        
        return Int(round(celsius))
        
    }
    
}
