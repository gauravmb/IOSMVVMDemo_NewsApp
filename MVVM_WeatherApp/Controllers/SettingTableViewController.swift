//
//  SettingTableViewController.swift
//  MVVM_WeatherApp
//
//  Created by M1092828 on 10/08/22.
//

import UIKit

class SettingTableViewController: UITableViewController {

    let settingsViewModel = SettingsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.visibleCells.forEach{ cell in
            cell.accessoryType = .none
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        if let cell = tableView.cellForRow(at: indexPath)
        {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingsViewModel.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath)
        {
            cell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingItem = settingsViewModel.units[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        cell.textLabel?.text = settingItem.displayName
        if settingItem == settingsViewModel.selectedUnit{
            cell.accessoryType = .checkmark
        }
        return cell
    }

}
