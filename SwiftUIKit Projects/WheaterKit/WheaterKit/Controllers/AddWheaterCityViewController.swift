//
//  AddWheaterCityViewController.swift
//  WheaterKit
//
//  Created by Seymen Nadir Elmas on 19.09.2024.
//

import Foundation
import UIKit
protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WheaterViewModel)
}
class AddWheaterCityViewController : UIViewController {
    @IBOutlet weak var cityNameTextField: UITextField!
    private var addWheaterVM = AddWheaterViewModel()
    var delegate: AddWeatherDelegate?
    @IBAction func saveCityButtonPressed() {
        
        if let city = cityNameTextField.text {
            addWheaterVM.addWheater(for: city) { (vm) in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
