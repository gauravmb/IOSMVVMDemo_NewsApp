//
//  WeatherListTableViewController.swift
//  MVVM_WeatherApp
//
//  Created by M1092828 on 08/08/22.
//

import UIKit

class WeatherListTableViewController: UITableViewController {

    private let weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherListTableViewCell
        let wvm = weatherListViewModel.modelAt(index: indexPath.row)
        cell.configure(vm: wvm)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let viewController = navigationController.viewControllers.first
        
        if(type(of: viewController) == AddCityWeatherViewController.self)
        {
            (viewController as! AddCityWeatherViewController).delegate = self
        }
        else if (type(of: viewController) == SettingTableViewController.self)
        {
            
        }
        
    }
    

}



extension WeatherListTableViewController:AddCityWeatherViewControllerDelegate
{
    func addCityWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm: vm)
        tableView.reloadData()
    }
}
