//
//  Pokemon.swift
//  apis, delegates
//
//  Created by Greg Hughes on 12/16/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import Foundation


struct TopLevelDictionary: Codable {
    
    let results : [Pokemon]
    
    
    
}

struct Pokemon: Codable, Equatable {
    
    let name : String
    let url: URL
    
    
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        if lhs.name == rhs.name {return true}
        else {return false}
    }
}



struct PokemonImage: Codable {
    
    let name : String
    let id : Int
    let sprites : Sprites
    
    
}

struct Sprites: Codable {
    let image : String?


    enum CodingKeys: String, CodingKey{
        
        case image = "front_default"
        
    }

}
