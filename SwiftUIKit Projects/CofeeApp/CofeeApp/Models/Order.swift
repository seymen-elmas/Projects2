//
//  Order.swift
//  CofeeApp
//
//  Created by Seymen Nadir Elmas on 18.09.2024.
//

import Foundation

enum CoffeType : String , Codable,CaseIterable{
    case cappucino
    case latte
    case cortado
    case americano
    case filter
    case flat
    case esspresso
    case mocha
}
enum CoffeSize : String , Codable,CaseIterable {
    case small
    case medium
    case large
}

struct Order :Codable{
    
    let name :String
    let email : String
    let type : CoffeType
    let size : CoffeSize
    
}

extension Order {
    
    static var all: Resource<[Order]> = {
        
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }
        
        return Resource<[Order]>(url: url)
        
    }()
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        
        let order = Order(vm)
        
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
        
    }
    
}

extension Order {
    
    init?(_ vm: AddCoffeeOrderViewModel) {
        
        guard let name = vm.name,
        let email = vm.email,
        let selectedType = CoffeType(rawValue: vm.selectedType!.lowercased()),
            let selectedSize = CoffeSize(rawValue: vm.selectedSize!.lowercased()) else {
        return nil
    }
    
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
}
}
