//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by Seymen Nadir Elmas on 11.09.2024.
//

import Foundation
extension String {
    
    func trimmedAndEscaped() -> String {
        
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
