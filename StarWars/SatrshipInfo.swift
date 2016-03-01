//
//  SatrshipInfo.swift
//  StarWars
//
//  Created by Michael San Minay on 01/03/2016.
//  Copyright © 2016 Michael San Minay. All rights reserved.
//

import Foundation


class StarshipInfo {
    
    
    
    var _name: String
    var _model: String
    var _starship_class:String
    var _manufacturer: String
    var _length:String
    var _crew:String
    var _passengers:String
    var _cargo_capacity:String
    var _hyperdrive_rating: String
    
    
    init(name: String,model:String,starship_class:String,manufacturer:String,length:String,crew:String,passenger:String,cargo_capacity:String,hyperdrive_rating:String){
        
        _name = name
        _model = model
        _starship_class = starship_class
        _manufacturer = manufacturer
        _length = length
        _crew = crew
        _passengers = passenger
        _cargo_capacity = cargo_capacity
        _hyperdrive_rating = hyperdrive_rating
        
    }
    
}