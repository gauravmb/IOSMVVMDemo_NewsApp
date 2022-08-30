//
//  WeatherListTableViewCell.swift
//  MVVM_WeatherApp
//
//  Created by M1092828 on 08/08/22.
//

import UIKit

class WeatherListTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel:UILabel!
    @IBOutlet weak var temperatureLabel:UILabel!
    
    func configure(vm:WeatherViewModel){
        self.cityNameLabel.text = vm.city
        self.temperatureLabel.text = vm.temperature.formatAsDegree()
    }

}
