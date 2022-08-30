//
//  SettingsViewModel.swift
//  MVVM_WeatherApp
//
//  Created by M1092828 on 10/08/22.
//

import Foundation

enum Unit:String,CaseIterable
{
    case celsius = "metric"
    case fahrenheit = "imperial"
    var displayName:String{
        get{
            switch(self){
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

class SettingsViewModel{
    var units = Unit.allCases
    var selectedUnit:Unit{
        get {
            let userDefaults = UserDefaults.standard
            let unitValue  = userDefaults.value(forKey: "unit") as? String
            if let value = unitValue
            {
                return Unit(rawValue: value)!
            }
            else
            {
                return Unit.celsius
            }

        }
        set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }

}
