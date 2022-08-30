//
//  Double+Extention.swift
//  MVVM_WeatherApp
//
//  Created by M1092828 on 08/08/22.
//

import Foundation

extension Double
{
    func formatAsDegree()->String{
        return String(format: "%.0f°", self)
    }
}
