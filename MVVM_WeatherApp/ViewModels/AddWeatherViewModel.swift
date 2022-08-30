//
//  AddWeatherViewModel.swift
//  MVVM_WeatherApp
//
//  Created by M1092828 on 08/08/22.
//

import Foundation

class AddWeatherViewModel
{
    func addWeather(city:String,  completion : @escaping (WeatherViewModel)->Void)
    {
        let weatherURL = Constants.URLs.urlForWeatherByCity(city: city)
        let weatherResource = Resource<WeatherResponse>(url: weatherURL, parse: {data in
            return try? JSONDecoder().decode(WeatherResponse.self, from: data)
        })
        WebService().load(resource: weatherResource, completion: {weatherResponse in
            if let weatherResponse = weatherResponse {
                completion(WeatherViewModel(weather: weatherResponse))
            }
        })
    }
}
