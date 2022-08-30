//
//  String+Extentions.swift
//  MVVM_WeatherApp
//
//  Created by M1092828 on 08/08/22.
//

import Foundation

struct Constants{
    struct URLs{
        static func urlForWeatherByCity(city:String)->URL{
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=de4a4f5385dc38b16856f81297aa3bab&units=imperial")!
        }
    }
}
