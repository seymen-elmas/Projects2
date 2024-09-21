//
//  String+Extension.swift
//  WheaterKit
//
//  Created by Seymen Nadir Elmas on 20.09.2024.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
