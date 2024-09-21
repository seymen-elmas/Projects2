//
//  WheaterListTableViewController.swift
//  WheaterKit
//
//  Created by Seymen Nadir Elmas on 19.09.2024.
//

import Foundation
import UIKit

class WheaterListTableViewController : UITableViewController ,AddWeatherDelegate{
    private var wheaterListViewModel = WheaterListViewModel()
    private var lastUnitSelection: Unit!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)!
        }
    }
    func addWeatherDidSave(vm: WheaterViewModel) {
        wheaterListViewModel.addWheaterViewModels(vm)
        self.tableView.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wheaterListViewModel.numberOfRows(section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WheaterCell", for: indexPath) as! WheaterCell
        let wheaterVM = wheaterListViewModel.modelAt(indexPath.row)
        cell.configure(wheaterVM)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWheaterCityViewController" {
            prepareSegueForAddWheaterCityViewController(segue: segue)
        }else if segue.identifier == "SettingTableViewController"{
            prepareSegueForSettingTableViewController(segue: segue)
        }
        
    }
    private func prepareSegueForSettingTableViewController(segue: UIStoryboardSegue) {
           
           guard let nav = segue.destination as? UINavigationController else {
               fatalError("NavigationController not found")
           }
           
           guard let settingsTVC = nav.viewControllers.first as? SettingTableViewController else {
               fatalError("SettingTableViewController not found")
           }
           
           settingsTVC.delegate = self
           
       }
    func prepareSegueForAddWheaterCityViewController(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWheaterCityVC = nav.viewControllers.first as? AddWheaterCityViewController else {
            fatalError("AddWheaterCityController not found")
        }
        
        addWheaterCityVC.delegate = self
    }
}
extension WheaterListTableViewController :SettingDelegate {
    func settingsDone(vm: SettingsViewModel) {
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
            wheaterListViewModel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)!
        }
    }
    
}
