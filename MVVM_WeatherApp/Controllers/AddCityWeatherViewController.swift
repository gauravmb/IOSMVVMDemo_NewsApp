//
//  AddCityWeatherViewController.swift
//  MVVM_WeatherApp
//
//  Created by M1092828 on 08/08/22.
//

import UIKit

protocol AddCityWeatherViewControllerDelegate{
    func addCityWeatherDidSave(vm:WeatherViewModel)
}

class AddCityWeatherViewController: UIViewController {

    private var addWeatherVM = AddWeatherViewModel()
    @IBOutlet weak var cityNameTextField:UITextField!
    
    var delegate:AddCityWeatherViewControllerDelegate?
    
    @IBAction func save()
    {
        if let city = cityNameTextField.text
        {
            addWeatherVM.addWeather(city: city, completion: {weatherVM in
                if let delegate = self.delegate {
                    delegate.addCityWeatherDidSave(vm: weatherVM)
                    self.dismiss(animated: true)
                }
            })
        }
    }
    
    @IBAction func close()
    {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
