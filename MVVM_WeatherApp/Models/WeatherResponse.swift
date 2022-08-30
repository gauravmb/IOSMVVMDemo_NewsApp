//
//  WeatherResponse.swift
//  MVVM_WeatherApp
//
//  Created by M1092828 on 08/08/22.
//

import Foundation

struct WeatherResponse:Decodable
{
    let main:Weather
    let name:String
}

struct Weather:Decodable
{
    let temp:Double
    let humidity:Double
}
