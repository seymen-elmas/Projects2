//
//  WheaterCell.swift
//  WheaterKit
//
//  Created by Seymen Nadir Elmas on 20.09.2024.
//
import Foundation
import UIKit

class WheaterCell : UITableViewCell {
    
    @IBOutlet var cityNameLabel : UILabel!
    @IBOutlet var tempratureLabel : UILabel!
    
    func configure (_ vm : WheaterViewModel){
        self.cityNameLabel.text = vm.city
        self.tempratureLabel.text = "\(vm.temprature.formatAtDegree())"
    }
}
