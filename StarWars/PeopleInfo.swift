//
//  PeopleInfo.swift
//  StarWars
//
//  Created by Michael San Minay on 01/03/2016.
//  Copyright © 2016 Michael San Minay. All rights reserved.
//



import Foundation



class PeopleInfo {
    
    
    var _name: String
    var _birth_year: String
    var _gender:String
    var _height: String
    var _homeworld:String
    var _url:String
    
    var _films:String
    var _starships:String
    
    
    
    init(newName: String,birth_year:String,gender:String,height:String,homeworld:String,url:String,films:String,starships:String){
        
        _name = newName
        _birth_year = birth_year
        _gender = gender
        _height = height
        _homeworld = homeworld
        _url = url
        _films = films
        _starships = starships
        
    }
    
    
    
    
}