//
//  WeatherListViewModel.swift
//  MVVM_WeatherApp
//
//  Created by M1092828 on 08/08/22.
//

import Foundation


class WeatherListViewModel{
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(vm : WeatherViewModel)
    {
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(section:Int)->Int
    {
        return weatherViewModels.count
    }
    
    func modelAt(index:Int)->WeatherViewModel
    {
        return weatherViewModels[index]
    }
}

class WeatherViewModel
{
    let weather:WeatherResponse
    
    init(weather:WeatherResponse)
    {
        self.weather = weather
    }
    
    var city:String{
        return weather.name
    }
    
    var temperature:Double
    {
        return weather.main.temp
    }
}

